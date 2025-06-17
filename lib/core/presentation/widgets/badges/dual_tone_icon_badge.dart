import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/icons/app_icon.dart';
import 'package:flutter/material.dart';

class DualToneIconBadge extends StatelessWidget {
  const DualToneIconBadge({
    required this.toneAccent,
    required this.toneBase,
    required this.icon,
    super.key,
  });

  final Color toneAccent;
  final Color toneBase;
  final AppIcon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.massive,
      height: AppSizes.massive,
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: toneAccent,
      ),
      child: Container(
        width: AppSizes.xxl,
        height: AppSizes.xxl,
        padding: const EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
          color: toneBase,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
