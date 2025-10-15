import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/features/stores/presentation/widgets/store_tile.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class StoresListCard extends StatelessWidget {
  const StoresListCard({
    required this.stores,
    required this.selectedType,
    required this.onTypeChanged,
    required this.searchQuery,
    required this.onSearchChanged,
    super.key,
  });

  final List<StoreResponse> stores;
  final String selectedType;
  final Function(String) onTypeChanged;
  final String searchQuery;
  final Function(String) onSearchChanged;

  final storeTypes = const <String>[
    'All',
    'Grocery',
    'Electronics',
    'Fashion',
    'Restaurant',
    'Pharmacy',
    'Other',
  ];

  List<StoreResponse> get _filteredStores {
    var filtered = stores;

    if (selectedType != 'All') {
      filtered = filtered.where((store) => store.type == selectedType).toList();
    }

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (store) =>
                store.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                store.description.toLowerCase().contains(searchQuery.toLowerCase()) ||
                store.tags.any((tag) => tag.toLowerCase().contains(searchQuery.toLowerCase())),
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
              child: _buildStoresList(),
            ),
          ],
        ),
      ),
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

  Widget _buildStoresList() {
    final filteredStores = _filteredStores;

    if (filteredStores.isEmpty) {
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
}
