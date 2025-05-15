import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/widgets/scaffolds/app_scaffold.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:credix_app/features/main/presentation/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BottomNavbarCubit>(),
      child: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, selectedIndex) {
          return AutoTabsRouter(
            routes: const [
              HomeRoute(),
              HistoryRoute(),
              BarcodeRoute(),
              OffersRoute(),
              SettingsRoute(),
            ],
            transitionBuilder: (context, child, animation) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
                child: child,
              );
            },
            homeIndex: 0,
            builder: (context, child) {
              final tabsRouter = AutoTabsRouter.of(context);
              return AppScaffold(
                activeIndex: tabsRouter.activeIndex,
                onTabSelected: tabsRouter.setActiveIndex,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
