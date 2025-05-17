import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionListCard extends StatelessWidget {
  const TransactionListCard({this.isPreview = true, super.key, this.onViewAll});

  final bool isPreview;
  final void Function()? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md).copyWith(top: isPreview ? AppSizes.lg : 0),
        decoration: BoxDecoration(
          color: AppColors.neutral1,
          borderRadius: BorderRadius.circular(AppSizes.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isPreview) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText.h2('Transactions'),
                  InkWell(
                    onTap: onViewAll,
                    child: const AppText.labelSmall(
                      'view all',
                      color: AppColors.neutral7,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.md),
            ],
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
                    padding: EdgeInsets.only(top: index == 0 ? AppSizes.xs : 0, bottom: index == 19 ? AppSizes.xs : 0),
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
