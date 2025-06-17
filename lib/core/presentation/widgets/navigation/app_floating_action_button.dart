import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.jumbo,
      height: AppSizes.jumbo,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary200,
            offset: Offset(0, AppSizes.xs),
            blurRadius: AppSizes.md,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: AppColors.primary500,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.mdPlus),
            child: AppIcon(
              icon: Assets.icons.barcodeOutline,
              color: AppColors.neutral1,
              size: AppSizes.xxl,
            ),
          ),
        ),
      ),
    );
  }
}
