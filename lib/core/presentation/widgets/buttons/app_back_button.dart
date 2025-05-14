import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/icons/app_icon.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.neutral1,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: AppSizes.s48,
          height: AppSizes.s48,
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: AppIcon(
            icon: Assets.icons.chevronLeftOutline,
            color: AppColors.neutral10,
          ),
        ),
      ),
    );
  }
}
