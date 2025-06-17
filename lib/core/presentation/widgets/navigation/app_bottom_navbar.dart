import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.activeIndex,
    required this.onTabSelected,
    super.key,
  });

  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 0,
      elevation: 0,
      height: AppSizes.jumbo,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      color: AppColors.neutral1,
      child: Row(
        children: [
          Expanded(
            child: TabItem(
              isSelected: activeIndex == 0,
              filledIcon: Assets.icons.homeFilled,
              outlineIcon: Assets.icons.homeOutline,
              label: 'Home',
              index: 0,
              onTabSelected: onTabSelected,
            ),
          ),
          Expanded(
            child: TabItem(
              isSelected: activeIndex == 1,
              filledIcon: Assets.icons.emptyWalletFilled,
              outlineIcon: Assets.icons.emptyWalletOutline,
              label: 'Transactions',
              index: 1,
              onTabSelected: onTabSelected,
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: TabItem(
              isSelected: activeIndex == 3,
              filledIcon: Assets.icons.tagFilled,
              outlineIcon: Assets.icons.tagOutline,
              label: 'Offers',
              index: 3,
              onTabSelected: onTabSelected,
            ),
          ),
          Expanded(
            child: TabItem(
              isSelected: activeIndex == 4,
              filledIcon: Assets.icons.settingsFilled,
              outlineIcon: Assets.icons.settingsOutline,
              label: 'Settings',
              index: 4,
              onTabSelected: onTabSelected,
            ),
          ),
        ],
      ),
    );
  }
}
