import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/navigation/app_floating_action_button.dart';
import 'package:credix_app/core/presentation/widgets/navigation/bottom_nav_cubit.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BottomNavbarCubit>(),
      child: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, selectedIndex) {
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
              selectedIndex: selectedIndex,
              onItemSelected: (index) => context.read<BottomNavbarCubit>().selectTab(index: index),
            ),
            floatingActionButton: AppFloatingActionButton(
              onTap: () {},
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}
