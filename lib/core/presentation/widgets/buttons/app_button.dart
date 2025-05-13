import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.content,
    this.onPressed,
    this.enabled = true,
    super.key,
  }) : assert(enabled == false || onPressed != null, 'onPressed must be provided if enabled is true');

  final Widget content;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(enabled ? AppColors.neutral11 : AppColors.neutral9),
          overlayColor: const WidgetStatePropertyAll(AppColors.neutral9),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.xs),
            ),
          ),
        ),
        child: content,
      ),
    );
  }
}
