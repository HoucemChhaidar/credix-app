import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreTile extends StatelessWidget {
  const StoreTile({
    required this.store,
    super.key,
  });

  final StoreResponse store;

  Future<void> _openMaps() async {
    final url =
        'https://www.google.com/maps/dir/?api=1&destination=${store.latitude},${store.longitude}&travelmode=driving';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.sm),
              image: DecorationImage(
                image: NetworkImage(store.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.smPlus),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.labelLarge(store.name, color: AppColors.neutral11),
                const SizedBox(height: 2),
                AppText.labelSmall(store.description, color: AppColors.neutral7),
                const SizedBox(height: 4),
                Wrap(
                  spacing: AppSizes.xs,
                  runSpacing: AppSizes.xs,
                  children: store.tags
                      .take(3)
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.neutral3,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: AppText.labelSmall(
                            tag,
                            color: AppColors.neutral7,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    AppIcon(
                      icon: Assets.icons.locationFilled,
                      size: AppSizes.smPlus,
                      color: AppColors.neutral6,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Expanded(
                      child: AppText.labelSmall(
                        store.address,
                        color: AppColors.neutral6,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Column(
            children: [
              Container(
                width: AppSizes.xxl,
                height: AppSizes.xxl,
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: const BoxDecoration(
                  color: AppColors.green500,
                  shape: BoxShape.circle,
                ),
                child: AppIcon(
                  icon: Assets.icons.navigationFilled,
                  color: AppColors.neutral1,
                ),
              ),
              const SizedBox(height: AppSizes.xs),
              AppText.labelSmall(
                '${store.distance.toStringAsFixed(1)} km',
                color: AppColors.neutral7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
