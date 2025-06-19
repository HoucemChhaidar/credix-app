import 'dart:math' as math;

import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/buttons/app_button.dart';
import 'package:credix_app/core/presentation/widgets/icons/app_icon.dart';
import 'package:credix_app/core/presentation/widgets/text/app_text.dart';
import 'package:credix_app/features/wallet/data/models/wallet_response.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.loading,
    this.wallet,
    this.onRetryPressed,
    super.key,
  });

  final WalletResponse? wallet;
  final bool loading;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      containersColor: AppColors.neutral12,
      effect: const ShimmerEffect(
        baseColor: AppColors.neutral8,
        highlightColor: AppColors.neutral10,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.neutral12,
          borderRadius: BorderRadius.circular(AppSizes.lg),
        ),
        child: wallet != null
            ? Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: Skeleton.shade(
                      child: _RotatedShapes(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.xl,
                      vertical: AppSizes.lg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.labelLarge('Total balance', color: AppColors.neutral6),
                            SizedBox(height: AppSizes.xs),
                            AppText.display('1,746.862', color: AppColors.neutral1),
                            SizedBox(height: AppSizes.lg),
                            AppText.labelLarge('Account number', color: AppColors.neutral6),
                            SizedBox(height: AppSizes.xs),
                            AppText.h2('**** **** **** **96', color: AppColors.neutral1),
                          ],
                        ),
                        Skeleton.shade(
                          child: AppIcon(
                            icon: Assets.icons.arrowRightOutline,
                            color: AppColors.neutral1,
                            size: AppSizes.xl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  children: [
                    const SizedBox(height: AppSizes.huge),
                    const AppText.labelLarge(
                      'Something went wrong!',
                      color: AppColors.neutral1,
                    ),
                    const SizedBox(height: AppSizes.xl),
                    AppButton(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppIcon(
                            icon: Assets.icons.refreshOutline,
                            color: AppColors.neutral1,
                            size: AppSizes.mdPlus,
                          ),
                          const SizedBox(width: AppSizes.sm),
                          const AppText.labelMedium('Try again', color: AppColors.neutral1),
                        ],
                      ),
                      onPressed: onRetryPressed,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _RotatedShapes extends StatelessWidget {
  const _RotatedShapes();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 126.56,
      height: 135,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 65.72,
            child: Transform.rotate(
              angle: -30 * math.pi / 180,
              alignment: Alignment.topLeft,
              child: Container(
                width: AppSizes.jumbo,
                height: AppSizes.jumbo,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.mdPlus),
                  border: Border.all(color: AppColors.neutral9),
                ),
              ),
            ),
          ),
          Positioned(
            left: 17.28,
            top: 40,
            child: Transform.rotate(
              angle: -30 * math.pi / 180,
              alignment: Alignment.topLeft,
              child: Container(
                width: AppSizes.jumbo,
                height: AppSizes.jumbo,
                decoration: BoxDecoration(
                  color: AppColors.neutral10,
                  borderRadius: BorderRadius.circular(AppSizes.mdPlus),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
