import 'package:credix_app/shared/theme/app_colors.dart';
import 'package:credix_app/shared/widgets/blurred_glow_circle.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.neutral3,
      child: Stack(
        children: [
          // @formatter:off
          const Positioned(top   : 96 , right: -123, child: BlurredGlowCircle(size: 220, color: Color(0xFFFFE9C8))),
          const Positioned(bottom: -96, right: 73  , child: BlurredGlowCircle(size: 220, color: Color(0xFFFFF4C8))),
          child,
          // @formatter:on
        ],
      ),
    );
  }
}
