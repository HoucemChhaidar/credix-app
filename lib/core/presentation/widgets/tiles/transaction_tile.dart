import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/transactions/data/models/transaction_response.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum TransactionTileState { loading, success }

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    required this.state,
    this.transaction,
    super.key,
  });

  final TransactionTileState state;
  final TransactionResponse? transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: AppSizes.smPlus),
          _buildContent(),
          const Spacer(),
          _buildAmountAndChevron(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    switch (state) {
      case TransactionTileState.loading:
        return Skeleton.shade(
          child: Container(
            width: AppSizes.xxxl,
            height: AppSizes.xxxl,
            padding: const EdgeInsets.all(AppSizes.smPlus),
            decoration: const BoxDecoration(
              color: AppColors.neutral3,
              shape: BoxShape.circle,
            ),
          ),
        );
      case TransactionTileState.success:
        return Container(
          width: AppSizes.xxxl,
          height: AppSizes.xxxl,
          padding: const EdgeInsets.all(AppSizes.smPlus),
          decoration: const BoxDecoration(
            color: AppColors.neutral3,
            shape: BoxShape.circle,
          ),
          child: AppIcon(
            icon: transaction!.type == 'PAYMENT' ? Assets.icons.arrowDownLeft : Assets.icons.arrowUpRightOutline,
            color: transaction!.type == 'PAYMENT' ? AppColors.red500 : AppColors.green500,
          ),
        );
    }
  }

  Widget _buildContent() {
    switch (state) {
      case TransactionTileState.loading:
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton.shade(
                child: Container(
                  width: 80,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.neutral11,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Skeleton.shade(
                child: Container(
                  width: 60,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.neutral7,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        );
      case TransactionTileState.success:
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.labelMedium(
                transaction!.transactionId!.split('-').last,
                color: AppColors.neutral11,
              ),
              AppText.labelSmall(
                DateFormat('dd/MM/yy • HH:mm').format(DateTime.parse(transaction!.completedAt!)),
                color: AppColors.neutral7,
              ),
            ],
          ),
        );
    }
  }

  Widget _buildAmountAndChevron() {
    switch (state) {
      case TransactionTileState.loading:
        return Row(
          spacing: AppSizes.smPlus,
          children: [
            Skeleton.shade(
              child: Container(
                width: 70,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.neutral11,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Skeleton.shade(
              child: Container(
                width: AppSizes.xl,
                height: AppSizes.xl,
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: const BoxDecoration(
                  color: AppColors.neutral3,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      case TransactionTileState.success:
        return Row(
          spacing: AppSizes.smPlus,
          children: [
            AppText.labelLarge(
              transaction!.type == 'PAYMENT'
                  ? '- ${transaction!.amount!.toStringAsFixed(3)}'
                  : '+ ${transaction!.amount!.toStringAsFixed(3)}',
              color: transaction!.type == 'PAYMENT' ? AppColors.red500 : AppColors.green500,
            ),
            Container(
              width: AppSizes.xl,
              height: AppSizes.xl,
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: const BoxDecoration(
                color: AppColors.neutral3,
                shape: BoxShape.circle,
              ),
              child: AppIcon(
                icon: Assets.icons.chevronRightOutline,
                color: AppColors.neutral11,
              ),
            ),
          ],
        );
    }
  }
}
