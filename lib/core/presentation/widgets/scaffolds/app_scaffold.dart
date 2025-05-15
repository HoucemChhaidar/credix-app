import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/navigation/app_floating_action_button.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.activeIndex,
    required this.onTabSelected,
    required this.child,
    super.key,
  });

  final int activeIndex;
  final ValueChanged<int> onTabSelected;
  final Widget child;

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
      floatingActionButton: AppFloatingActionButton(onTap: () => getIt<AppRouter>().push(const BarcodeRoute())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
