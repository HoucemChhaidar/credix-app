import 'package:credix_app/core/ui/theme/theme.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWrapper extends StatelessWidget {
  const LogoWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral1,
        borderRadius: BorderRadius.circular(AppSizes.md),
      ),
      child: SvgPicture.asset(Assets.logo.credixLogo.path),
    );
  }
}
