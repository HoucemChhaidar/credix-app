import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/resources/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({required this.buttonText, required this.onPressed, super.key});

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: const WidgetStatePropertyAll(AppColors.neutral11),
          overlayColor: const WidgetStatePropertyAll(AppColors.neutral9),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: AppSizes.md),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.xs),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.neutral1,
          ),
        ),
      ),
    );
  }
}
