import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/core/utils/location_service.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreTile extends StatelessWidget {
  const StoreTile({
    required this.store,
    super.key,
  });

  final StoreResponse store;

  Future<void> _openMaps(BuildContext context) async {
    if (store.latitude == null || store.longitude == null) return;

    final isLocationEnabled = await LocationService.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      _showLocationServiceDialog(context);
      return;
    }

    final hasPermission = await LocationService.hasLocationPermission();
    if (!hasPermission) {
      final granted = await LocationService.requestLocationPermission();
      if (!granted) {
        _showPermissionDialog(context);
        return;
      }
    }

    final currentPosition = await LocationService.getCurrentPosition();

    String url;
    if (currentPosition != null) {
      url = 'https://www.google.com/maps/dir/?api=1'
          '&origin=${currentPosition.latitude},${currentPosition.longitude}'
          '&destination=${store.latitude},${store.longitude}'
          '&travelmode=driving';
    } else {
      url = 'https://www.google.com/maps/search/?api=1'
          '&query=${store.latitude},${store.longitude}';
    }

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      _showErrorDialog(context);
    }
  }

  void _showLocationServiceDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text('Please enable location services to get directions to this store.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openLocationSettings();
            },
            child: const Text('Enable'),
          ),
        ],
      ),
    );
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text('This app needs location permission to provide directions to stores.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cannot Open Maps'),
        content: const Text('Unable to open maps application. Please make sure you have a maps app installed.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasCoordinates = store.latitude != null && store.longitude != null;

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
              image: store.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(store.imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: AppColors.neutral3,
            ),
            child: store.imageUrl == null
                ? Center(
                    child: AppIcon(
                      icon: Assets.icons.shopFilled,
                      color: AppColors.neutral6,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: AppSizes.smPlus),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.labelLarge(store.name ?? 'Unknown Store', color: AppColors.neutral11),
                if (store.description != null) ...[
                  const SizedBox(height: 2),
                  AppText.labelSmall(
                    store.description!,
                    color: AppColors.neutral7,
                  ),
                ],
                const SizedBox(height: 4),
                if (store.type != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.neutral3,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AppText.labelSmall(
                      store.type!,
                      color: AppColors.neutral7,
                    ),
                  ),
                if (store.address != null) ...[
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
                          store.address!,
                          color: AppColors.neutral6,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Column(
            children: [
              InkWell(
                onTap: hasCoordinates ? () => _openMaps(context) : null,
                borderRadius: BorderRadius.circular(AppSizes.xxl),
                child: Container(
                  width: AppSizes.xxl,
                  height: AppSizes.xxl,
                  padding: const EdgeInsets.all(AppSizes.sm),
                  decoration: BoxDecoration(
                    color: hasCoordinates ? AppColors.green500 : AppColors.neutral4,
                    shape: BoxShape.circle,
                  ),
                  child: AppIcon(
                    icon: Assets.icons.navigationFilled,
                    color: AppColors.neutral1,
                  ),
                ),
              ),
              if (hasCoordinates) ...[
                const SizedBox(height: AppSizes.xs),
                const AppText.labelSmall(
                  'Directions',
                  color: AppColors.neutral7,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
