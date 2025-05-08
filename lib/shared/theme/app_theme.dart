import 'package:credix_app/shared/theme/app_colors.dart';
import 'package:credix_app/shared/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.neutral1,
      primaryColor: AppColors.primary500,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary500,
        onPrimary: AppColors.neutral1,
        primaryContainer: AppColors.primary100,
        onPrimaryContainer: AppColors.primary900,
        secondary: AppColors.green500,
        onSecondary: AppColors.neutral1,
        secondaryContainer: AppColors.green100,
        onSecondaryContainer: AppColors.green900,
        error: AppColors.red500,
        onError: AppColors.neutral1,
        errorContainer: AppColors.red100,
        onErrorContainer: AppColors.red900,
        surface: AppColors.neutral1,
        onSurface: AppColors.neutral13,
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      fontFamily: 'Inter',
      useMaterial3: true,
    );
  }
}
