import 'package:auto_route/annotations.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      child: Column(
        spacing: AppSizes.md,
        children: [
          ProfileHeader(),
          BalanceCard(),
          TransactionsListCard(),
        ],
      ),
    );
  }
}
