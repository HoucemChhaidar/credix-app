import 'package:credix_app/core/ui/theme/theme.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    required this.icon,
    super.key,
    this.size = AppSizes.lg,
    this.color = AppColors.neutral7,
  });

  final SvgGenImage icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: icon.svg(
        width: size,
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
