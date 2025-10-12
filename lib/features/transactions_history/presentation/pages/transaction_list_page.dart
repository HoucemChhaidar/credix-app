import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionListPage extends StatelessWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.h1('Transactions'),
        SizedBox(height: AppSizes.md),
        TransactionListCard(isPreview: false),
      ],
    );
  }
}
