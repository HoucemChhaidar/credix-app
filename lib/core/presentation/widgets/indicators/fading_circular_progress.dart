import 'dart:math' as math;

import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class FadingCircularProgress extends StatefulWidget {
  const FadingCircularProgress({
    super.key,
    this.size = 20,
    this.strokeWidth = 2,
    this.duration = const Duration(milliseconds: 1200),
  });

  final double size;
  final double strokeWidth;
  final Duration duration;

  @override
  State<FadingCircularProgress> createState() => _FadingCircularProgressState();
}

class _FadingCircularProgressState extends State<FadingCircularProgress> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: CustomPaint(
              painter: _FadingCircularPainter(strokeWidth: widget.strokeWidth),
            ),
          );
        },
      ),
    );
  }
}

class _FadingCircularPainter extends CustomPainter {
  _FadingCircularPainter({required this.strokeWidth});

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width / 2,
    );

    final paint = Paint()
      ..shader = const SweepGradient(
        colors: [
          Colors.transparent,
          AppColors.neutral1,
        ],
        stops: [0.0, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -0.5,
      2 * math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
