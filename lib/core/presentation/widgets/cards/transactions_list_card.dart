import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionsListCard extends StatelessWidget {
  const TransactionsListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        padding: const EdgeInsets.fromLTRB(AppSizes.md, AppSizes.lg, AppSizes.md, 0),
        decoration: BoxDecoration(
          color: AppColors.neutral1,
          borderRadius: BorderRadius.circular(AppSizes.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.h1('Transactions'),
                AppText.labelSmall('view all', color: AppColors.neutral7),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            Expanded(
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                separatorBuilder: (_, __) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.xxs),
                  child: Divider(height: 1, color: AppColors.neutral3),
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 19 ? AppSizes.xs : 0),
                    child: const TransactionTile(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
