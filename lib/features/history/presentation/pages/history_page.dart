import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          spacing: AppSizes.xs,
          children: [
            AppBackButton(),
            AppText.h1('Transactions'),
          ],
        ),
        SizedBox(height: AppSizes.md),
        TransactionsListCard(isPreview: false),
      ],
    );
  }
}
