import 'package:auto_route/annotations.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BarcodePage extends StatelessWidget {
  const BarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppBackButton(),
        SizedBox(height: AppSizes.md),
        BalanceCard(),
      ],
    );
  }
}
