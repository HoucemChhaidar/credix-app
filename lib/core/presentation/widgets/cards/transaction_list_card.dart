import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/transactions/data/models/transaction_response.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum TransactionListState { loading, loaded, empty, error }

class TransactionListCard extends StatelessWidget {
  const TransactionListCard({
    required this.transactions,
    this.isPreview = true,
    this.state = TransactionListState.loaded,
    this.errorMessage,
    super.key,
    this.onViewAll,
    this.onRetry,
  });

  final bool isPreview;
  final TransactionListState state;
  final String? errorMessage;
  final void Function()? onViewAll;
  final VoidCallback? onRetry;
  final List<TransactionResponse> transactions;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md).copyWith(top: isPreview ? AppSizes.lg : 0),
        decoration: BoxDecoration(
          color: AppColors.neutral1,
          borderRadius: BorderRadius.circular(AppSizes.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isPreview) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText.h2('Recent Activity'),
                  InkWell(
                    onTap: onViewAll,
                    child: Row(
                      children: [
                        const AppText.labelSmall(
                          'View all',
                          color: AppColors.neutral7,
                        ),
                        const SizedBox(width: AppSizes.xs),
                        AppIcon(
                          icon: Assets.icons.chevronRightOutline,
                          size: AppSizes.smPlus,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.md),
            ],
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isPreview && state == TransactionListState.loaded && transactions.isNotEmpty) {
      return _buildPreviewContent();
    }

    switch (state) {
      case TransactionListState.loading:
        return _buildLoadingContent();
      case TransactionListState.loaded:
        return _buildLoadedContent();
      case TransactionListState.empty:
        return _buildEmptyContent();
      case TransactionListState.error:
        return _buildErrorContent();
    }
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
        itemCount: 20,
        separatorBuilder: (_, __) => const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.xs),
          child: Divider(height: 1, color: AppColors.neutral3),
        ),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? AppSizes.sm : 0, bottom: index == 19 ? AppSizes.sm : 0),
            child: const TransactionTile(
              state: TransactionTileState.loading,
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadedContent() {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.xs),
        child: Divider(height: 1, color: AppColors.neutral3),
      ),
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? AppSizes.sm : 0,
            bottom: index == transactions.length - 1 ? AppSizes.sm : 0,
          ),
          child: TransactionTile(
            state: TransactionTileState.success,
            transaction: transactions[index],
          ),
        );
      },
    );
  }

  Widget _buildPreviewContent() {
    return Column(
      children: [
        _buildPreviewStats(),
        const SizedBox(height: AppSizes.md),
        Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactions.length > 10 ? 10 : transactions.length,
            separatorBuilder: (_, __) => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.xs),
              child: Divider(height: 1, color: AppColors.neutral3),
            ),
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? AppSizes.sm : 0,
                  bottom: index == (transactions.length > 3 ? 2 : transactions.length - 1) ? AppSizes.sm : 0,
                ),
                child: TransactionTile(
                  state: TransactionTileState.success,
                  transaction: transactions[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewStats() {
    final totalSpent = transactions.where((t) => t.type == 'PAYMENT').fold(0.0, (sum, t) => sum + (t.amount ?? 0));
    final totalReceived = transactions.where((t) => t.type != 'PAYMENT').fold(0.0, (sum, t) => sum + (t.amount ?? 0));

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.neutral2,
        borderRadius: BorderRadius.circular(AppSizes.sm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Spent', '-${totalSpent.toStringAsFixed(3)}', AppColors.red500),
          _buildStatItem('Received', '+${totalReceived.toStringAsFixed(3)}', AppColors.green500),
          _buildStatItem('Total', transactions.length.toString(), AppColors.neutral11),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        AppText.labelSmall(label, color: AppColors.neutral7),
        const SizedBox(height: AppSizes.xs),
        AppText.labelMedium(value, color: color),
      ],
    );
  }

  Widget _buildEmptyContent() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.h3(
          'No transactions yet',
          color: AppColors.neutral7,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sm),
        AppText.labelMedium(
          'Your transactions will appear here',
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
