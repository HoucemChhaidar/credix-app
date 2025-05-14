import 'package:credix_app/core/presentation/resources/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  // === Display ===
  const AppText.display(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.display,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  // === Headline ===
  const AppText.h1(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.h1,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText.h2(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.h2,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText.h3(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.h3,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  // === Body ===
  const AppText.bodyLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.bodyLarge,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText.bodyMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.bodyMedium,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  // === Label ===
  const AppText.labelLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.labelLarge,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText.labelMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.labelMedium,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText.labelSmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.labelSmall,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  // === Receipt ===
  const AppText.receiptLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.receiptLarge,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText.receiptMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    VoidCallback? onTap,
  }) : this._(
          key: key,
          text: text,
          style: AppTextStyles.receiptMedium,
          color: color,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          onTap: onTap,
        );

  const AppText._({
    required this.text,
    required this.style,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.onTap,
    super.key,
  });

  final String text;
  final TextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final styledText = Text(
      text,
      style: style.copyWith(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );

    return onTap != null ? GestureDetector(onTap: onTap, child: styledText) : styledText;
  }
}
