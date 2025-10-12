import 'dart:math' as math;

import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/media/app_image.dart';
import 'package:credix_app/core/presentation/widgets/text/app_text.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BarcodeCard extends StatelessWidget {
  const BarcodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.neutral12,
          borderRadius: BorderRadius.circular(AppSizes.lg),
        ),
        child: Stack(
          children: [
            const Positioned(
              bottom: 0,
              right: 0,
              child: _RotatedShapes(),
            ),
            Padding(
              padding: const EdgeInsets.all(48),
              child: RotatedBox(
                quarterTurns: 1,
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 32,
                        children: [
                          AppImage.asset(
                            asset: Assets.images.doodleArrowLeft,
                          ),
                          const AppText.labelLarge(
                            'Scan Here',
                            color: AppColors.neutral1,
                          ),
                          AppImage.asset(
                            asset: Assets.images.doodleArrowRight,
                          ),
                        ],
                      ),
                      AppImage.asset(
                        asset: Assets.images.barcodeExample,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RotatedShapes extends StatelessWidget {
  const _RotatedShapes();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 202.5,
      height: 189.85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 60,
            child: Transform.rotate(
              angle: -30 * math.pi / 180,
              alignment: Alignment.topLeft,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFF454545),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 38.58,
            top: 85.92,
            child: Transform.rotate(
              angle: -30 * math.pi / 180,
              alignment: Alignment.topLeft,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF262626),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
