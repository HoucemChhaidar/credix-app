import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: AppImage.asset(
            asset: Assets.images.portraitExample,
            width: AppSizes.s48,
            height: AppSizes.s48,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.labelMedium('Welcome back!', color: AppColors.neutral7),
            AppText.labelLarge('Mrs. Cornelius Marks'),
          ],
        ),
      ],
    );
  }
}
