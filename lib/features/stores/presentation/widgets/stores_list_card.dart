import 'package:change_case/change_case.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/features/stores/presentation/widgets/store_tile.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StoresListCard extends StatelessWidget {
  const StoresListCard({
    required this.stores,
    required this.selectedType,
    required this.onTypeChanged,
    required this.searchQuery,
    required this.onSearchChanged,
    this.isLoading = false,
    this.isEmpty = false,
    this.errorMessage,
    this.onRetry,
    super.key,
  });

  final List<StoreResponse> stores;
  final String selectedType;
  final Function(String) onTypeChanged;
  final String searchQuery;
  final Function(String) onSearchChanged;
  final bool isLoading;
  final bool isEmpty;
  final String? errorMessage;
  final VoidCallback? onRetry;

  List<String> get storeTypes => const <String>[
        'All',
        'Retail',
        'Restaurant',
        'Cafe',
        'Clothing',
        'Grocery',
        'Pharmacy',
        'Electronics',
        'BookStore',
        'GasStation',
      ];

  List<StoreResponse> get _filteredStores {
    var filtered = stores;

    if (selectedType != 'All') {
      filtered = filtered.where((store) => store.type!.toCapitalCase() == selectedType).toList();
    }

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (store) =>
                store.name?.toLowerCase().contains(searchQuery.toLowerCase()) == true ||
                store.description?.toLowerCase().contains(searchQuery.toLowerCase()) == true ||
                store.merchantName?.toLowerCase().contains(searchQuery.toLowerCase()) == true,
          )
          .toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md).copyWith(top: AppSizes.lg),
        decoration: BoxDecoration(
          color: AppColors.neutral1,
          borderRadius: BorderRadius.circular(AppSizes.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchBar(),
            const SizedBox(height: AppSizes.md),
            _buildTypeChips(),
            const SizedBox(height: AppSizes.md),
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return _buildLoadingContent();
    }

    if (errorMessage != null) {
      return _buildErrorContent();
    }

    if (isEmpty) {
      return _buildEmptyContent();
    }

    return _buildStoresList();
  }

  Widget _buildLoadingContent() {
    return Skeletonizer(
      containersColor: AppColors.neutral3,
      effect: const ShimmerEffect(
        baseColor: AppColors.neutral2,
        highlightColor: AppColors.neutral4,
        duration: Duration(milliseconds: 1200),
      ),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (_, __) => const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.xs),
          child: Divider(height: 1, color: AppColors.neutral3),
        ),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? AppSizes.sm : 0,
              bottom: index == 9 ? AppSizes.sm : 0,
            ),
            child: const _SkeletonStoreTile(),
          );
        },
      ),
    );
  }

  Widget _buildStoresList() {
    final filteredStores = _filteredStores;

    if (filteredStores.isEmpty) {
      return _buildEmptyContent();
    }

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredStores.length,
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.xs),
        child: Divider(height: 1, color: AppColors.neutral3),
      ),
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? AppSizes.sm : 0,
            bottom: index == filteredStores.length - 1 ? AppSizes.sm : 0,
          ),
          child: StoreTile(store: filteredStores[index]),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.neutral3,
        borderRadius: BorderRadius.circular(AppSizes.lg),
      ),
      child: Row(
        children: [
          AppIcon(
            icon: Assets.icons.searchOutline,
            color: AppColors.neutral6,
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: TextField(
              onChanged: onSearchChanged,
              decoration: const InputDecoration(
                hintText: 'Search stores...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.neutral6),
              ),
              style: const TextStyle(
                color: AppColors.neutral11,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: storeTypes.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.sm),
        itemBuilder: (_, index) {
          final type = storeTypes[index];
          final isSelected = selectedType == type;

          return ChoiceChip(
            label: AppText.labelSmall(type, color: isSelected ? AppColors.neutral1 : AppColors.neutral11),
            selected: isSelected,
            onSelected: (_) => onTypeChanged(type),
            backgroundColor: AppColors.neutral1,
            selectedColor: AppColors.neutral11,
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyContent() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.h3(
          'No stores found',
          color: AppColors.neutral7,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sm),
        AppText.labelMedium(
          'Try adjusting your search or filters',
          color: AppColors.neutral6,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildErrorContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.h3(
          errorMessage ?? 'Something went wrong',
          color: AppColors.neutral7,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.lg),
        AppButton(
          content: const AppText.labelMedium('Retry', color: AppColors.neutral1),
          onPressed: onRetry,
        ),
      ],
    );
  }
}

class _SkeletonStoreTile extends StatelessWidget {
  const _SkeletonStoreTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.shade(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.sm),
                color: AppColors.neutral3,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.smPlus),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton.shade(
                  child: Container(
                    width: 120,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.neutral11,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Skeleton.shade(
                  child: Container(
                    width: 80,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.neutral7,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Skeleton.shade(
                  child: Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.neutral3,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Skeleton.ignore(
                      child: Container(
                        width: AppSizes.smPlus,
                        height: AppSizes.smPlus,
                        color: AppColors.neutral6,
                      ),
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Skeleton.shade(
                      child: Container(
                        width: 100,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.neutral6,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Skeleton.shade(
            child: Container(
              width: AppSizes.xxl,
              height: AppSizes.xxl,
              decoration: const BoxDecoration(
                color: AppColors.neutral4,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
