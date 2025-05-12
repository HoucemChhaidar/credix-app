import 'package:flutter/material.dart';

class AppTextStyles {
  static const _interFontFamily = 'Inter';
  static const _shareTechFontFamily = 'Share Tech Mono';

  // Display
  static const TextStyle displayLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: _interFontFamily,
    height: 1,
  );

  // Headline
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: _interFontFamily,
    height: 1,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: _interFontFamily,
    height: 1,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: _interFontFamily,
    height: 1,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _interFontFamily,
    height: 1,
  );

  // Label
  static const TextStyle labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: _interFontFamily,
    height: 1,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: _interFontFamily,
    height: 1,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: _interFontFamily,
  );

  // Receipt
  static const TextStyle receiptLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: _shareTechFontFamily,
    height: 1,
  );
  static const TextStyle receiptMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: _shareTechFontFamily,
    height: 1,
  );
}
