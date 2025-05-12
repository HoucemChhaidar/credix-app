import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredGlowCircle extends StatelessWidget {
  const BlurredGlowCircle({
    required this.size,
    required this.color,
    this.blurSigma = 50,
    super.key,
  });

  final double size;
  final Color color;
  final double blurSigma;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: blurSigma,
        sigmaY: blurSigma,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
