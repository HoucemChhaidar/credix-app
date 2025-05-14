import 'package:flutter/material.dart';

class AppTextStyles {
  static const _interFontFamily = 'Inter';
  static const _shareTechFontFamily = 'Share Tech Mono';

  static const TextStyle display = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    fontFamily: _interFontFamily,
    height: 48 / 40,
  );

  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: _interFontFamily,
    height: 32 / 24,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: _interFontFamily,
    height: 28 / 20,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: _interFontFamily,
    height: 24 / 18,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _interFontFamily,
    height: 24 / 16,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _interFontFamily,
    height: 20 / 14,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _interFontFamily,
    height: 24 / 16,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _interFontFamily,
    height: 20 / 14,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: _interFontFamily,
    height: 16 / 12,
  );

  static const TextStyle receiptLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: _shareTechFontFamily,
    height: 28 / 24,
  );

  static const TextStyle receiptMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _shareTechFontFamily,
    height: 20 / 16,
  );
}
