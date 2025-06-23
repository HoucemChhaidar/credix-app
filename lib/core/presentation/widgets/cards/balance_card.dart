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

enum BalanceCardState { loading, success, error }

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.state,
    this.wallet,
    this.errorMessage,
    this.retryButtonText,
    this.onRetryPressed,
    super.key,
  });

  final BalanceCardState state;
  final WalletResponse? wallet;
  final String? errorMessage;
  final String? retryButtonText;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.neutral12,
        borderRadius: BorderRadius.circular(AppSizes.lg),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (state) {
      case BalanceCardState.loading:
        return _buildLoadingContent();
      case BalanceCardState.success:
        return _buildSuccessContent();
      case BalanceCardState.error:
        return _buildErrorContent();
    }
  }

  Widget _buildLoadingContent() {
    return Skeletonizer(
      containersColor: AppColors.neutral9,
      effect: const ShimmerEffect(
        baseColor: AppColors.neutral8,
        highlightColor: AppColors.neutral10,
        duration: Duration(milliseconds: 1200),
      ),
      child: Stack(
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
                    AppText.display('0.000 TND', color: AppColors.neutral1),
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
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const Positioned(
          top: 0,
          right: 0,
          child: _RotatedShapes(),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText.labelLarge('Total balance', color: AppColors.neutral6),
                  const SizedBox(height: AppSizes.xs),
                  AppText.display(
                    '${wallet?.balance.toStringAsFixed(3) ?? '0.000'} TND',
                    color: AppColors.neutral1,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  const AppText.labelLarge('Account number', color: AppColors.neutral6),
                  const SizedBox(height: AppSizes.xs),
                  AppText.h2(
                    _formatTokenizedId(wallet?.tokenizedId),
                    color: AppColors.neutral1,
                  ),
                ],
              ),
              AppIcon(
                icon: Assets.icons.arrowRightOutline,
                color: AppColors.neutral1,
                size: AppSizes.xl,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorContent() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSizes.huge),
          AppText.labelLarge(
            errorMessage ?? 'Something went wrong!',
            color: AppColors.neutral1,
            textAlign: TextAlign.center,
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
                AppText.labelMedium(retryButtonText ?? 'Retry', color: AppColors.neutral1),
              ],
            ),
            onPressed: onRetryPressed,
          ),
        ],
      ),
    );
  }

  String _formatTokenizedId(String? tokenizedId) {
    if (tokenizedId == null || tokenizedId.isEmpty) {
      return '**** **** **** ****';
    }

    if (tokenizedId.length >= 4) {
      return '**** **** **** ${tokenizedId.substring(tokenizedId.length - 4)}';
    }

    return tokenizedId;
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
