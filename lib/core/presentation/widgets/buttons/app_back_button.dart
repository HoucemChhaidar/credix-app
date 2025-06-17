import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/icons/app_icon.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      key: ValueKey(key),
      alignment: Alignment.centerLeft,
      child: Material(
        color: AppColors.neutral1,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: getIt<AppRouter>().back,
          child: Container(
            width: AppSizes.xxxl,
            height: AppSizes.xxxl,
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: AppIcon(
              icon: Assets.icons.chevronLeftOutline,
              color: AppColors.neutral10,
            ),
          ),
        ),
      ),
    );
  }
}
