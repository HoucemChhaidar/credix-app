import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
      child: Row(
        children: [
          Container(
            width: AppSizes.s48,
            height: AppSizes.s48,
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: const BoxDecoration(
              color: AppColors.neutral3,
              shape: BoxShape.circle,
            ),
            child: AppIcon(
              icon: Assets.icons.arrowDownLeft,
              color: AppColors.red500,
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.labelMedium(
                '02872010',
                color: AppColors.neutral11,
              ),
              AppText.labelSmall('03/05/24 • 16:33', color: AppColors.neutral7),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const AppText.labelLarge('-29.590', color: AppColors.red500),
              const SizedBox(width: AppSizes.sm),
              Container(
                width: AppSizes.xl,
                height: AppSizes.xl,
                padding: const EdgeInsets.all(AppSizes.xs),
                decoration: const BoxDecoration(
                  color: AppColors.neutral3,
                  shape: BoxShape.circle,
                ),
                child: AppIcon(icon: Assets.icons.chevronRightOutline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
