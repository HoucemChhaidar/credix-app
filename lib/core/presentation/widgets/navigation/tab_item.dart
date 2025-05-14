import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    required this.onTabSelected,
    required this.index,
    required this.label,
    required this.isSelected,
    required this.filledIcon,
    required this.outlineIcon,
    super.key,
  });

  final void Function(int index) onTabSelected;
  final int index;
  final String label;
  final bool isSelected;
  final SvgGenImage filledIcon;
  final SvgGenImage outlineIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTabSelected(index),
        splashColor: AppColors.primary50,
        customBorder: const CircleBorder(),
        child: SizedBox(
          height: AppSizes.s80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                icon: isSelected ? filledIcon : outlineIcon,
                color: isSelected ? AppColors.primary500 : AppColors.neutral6,
              ),
              const SizedBox(height: AppSizes.xxs),
              AppText.labelSmall(
                label,
                color: isSelected ? AppColors.primary500 : AppColors.neutral6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
