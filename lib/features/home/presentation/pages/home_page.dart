import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Column(
      spacing: AppSizes.md,
      children: [
        const ProfileHeader(),
        const BalanceCard(),
        TransactionListCard(
          onViewAll: () => tabsRouter.setActiveIndex(1),
        ),
      ],
    );
  }
}
