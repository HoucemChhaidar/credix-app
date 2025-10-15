import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/barcode/data/models/transaction_notification.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionSuccessContent extends StatelessWidget {
  const TransactionSuccessContent({required this.notification, required this.onClose, super.key});

  final TransactionNotification notification;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: const _HolePunchPainter(
          backgroundColor: AppColors.neutral1,
        ),
        child: Container(
          padding: const EdgeInsets.all(16).copyWith(top: 32),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.lg),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: const BoxDecoration(
                  color: AppColors.green50,
                  shape: BoxShape.circle,
                ),
                child: AppIcon(
                  icon: Assets.icons.tickCircleFilled,
                  size: AppSizes.xxxl,
                  color: AppColors.green500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: AppText.h3(
                  'Transaction Success!',
                  textAlign: TextAlign.center,
                  color: AppColors.green500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: DottedDashedLine(
                  height: 0,
                  width: double.infinity,
                  axis: Axis.horizontal,
                  dashWidth: 8,
                  dashColor: AppColors.neutral5,
                  dashSpace: 8,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: ShapeDecoration(
                  color: AppColors.neutral3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.labelMedium(
                      'Payment Details',
                      color: AppColors.neutral7,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _detailRow('Reference Number', notification.transactionId.split('-').last),
                    _detailRow('Vendor', notification.merchantName),
                    _detailRow(
                      'DateTime',
                      DateFormat('dd MMM yyyy, hh:mm a').format(notification.timestamp),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText.h2(
                      'Total Amount',
                      color: AppColors.neutral11,
                    ),
                    AppText.h2(
                      '${notification.amount.toStringAsFixed(3)} TND',
                      color: AppColors.neutral11,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AppButton(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(
                        icon: Assets.icons.exportOutline,
                        color: AppColors.neutral1,
                        size: AppSizes.mdPlus,
                      ),
                      const SizedBox(width: AppSizes.sm),
                      const AppText.labelMedium(
                        'Print Receipt',
                        color: AppColors.neutral1,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: AppText.labelMedium(
                  'Close',
                  color: AppColors.neutral6,
                  onTap: onClose,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.labelMedium(
          label,
          color: AppColors.neutral7,
        ),
        AppText.labelMedium(
          value,
          color: AppColors.neutral11,
        ),
      ],
    );
  }
}

class _HolePunchPainter extends CustomPainter {
  const _HolePunchPainter({
    required this.backgroundColor,
  });

  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;

    const holeY = 160.0;
    const holeRadius = 12.0;

    final containerPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(AppSizes.lg),
        ),
      );

    final leftHolePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: const Offset(0, holeY),
          radius: holeRadius,
        ),
      );

    final rightHolePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width, holeY),
          radius: holeRadius,
        ),
      );

    final pathWithLeftHole = Path.combine(
      PathOperation.difference,
      containerPath,
      leftHolePath,
    );

    final finalPath = Path.combine(
      PathOperation.difference,
      pathWithLeftHole,
      rightHolePath,
    );

    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
