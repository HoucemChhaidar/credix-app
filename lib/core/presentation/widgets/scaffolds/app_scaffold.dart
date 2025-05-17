import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    required this.activeIndex,
    required this.onTabSelected,
    required this.onFloatingActionButtonTap,
    super.key,
  });

  final int activeIndex;
  final Widget child;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onFloatingActionButtonTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Positioned(
            top: 96,
            right: -123,
            child: BlurredGlowCircle(size: 220, color: Color(0xFFFFE9C8)),
          ),
          const Positioned(
            bottom: -96,
            right: 73,
            child: BlurredGlowCircle(size: 220, color: Color(0xFFFFF4C8)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.md).copyWith(top: AppSizes.xs),
              child: child,
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        activeIndex: activeIndex,
        onTabSelected: onTabSelected,
      ),
      floatingActionButton: AppFloatingActionButton(onTap: onFloatingActionButtonTap),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
