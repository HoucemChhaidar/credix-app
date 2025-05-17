import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      animatePageTransition: false,
      routes: const [
        HomeRoute(),
        TransactionListRoute(),
        BarcodeRoute(),
        OffersRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return AppScaffold(
          activeIndex: tabsRouter.activeIndex,
          onTabSelected: tabsRouter.setActiveIndex,
          onFloatingActionButtonTap: () => tabsRouter.setActiveIndex(2),
          child: child,
        );
      },
    );
  }
}
