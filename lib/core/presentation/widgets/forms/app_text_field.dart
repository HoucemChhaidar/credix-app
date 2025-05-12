import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/resources/styles/app_text_styles.dart';
import 'package:credix_app/core/presentation/widgets/forms/password_visibility_cubit.dart';
import 'package:credix_app/core/presentation/widgets/icons/app_icon.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextField extends StatelessWidget {
  const AppTextField._({
    required this.controller,
    this.label,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = AppSizes.sm,
    this.useVisibilityToggle = false,
    super.key,
  });

  factory AppTextField.standard({
    required TextEditingController controller,
    String? label,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double borderRadius = AppSizes.sm,
    Key? key,
  }) {
    return AppTextField._(
      controller: controller,
      label: label,
      hintText: hintText,
      keyboardType: keyboardType,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      borderRadius: borderRadius,
      key: key,
    );
  }

  factory AppTextField.password({
    required TextEditingController controller,
    String? label,
    String? hintText,
    double borderRadius = AppSizes.sm,
    Key? key,
  }) {
    return AppTextField._(
      controller: controller,
      label: label,
      hintText: hintText,
      borderRadius: borderRadius,
      obscureText: true,
      useVisibilityToggle: true,
      key: key,
    );
  }

  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final bool useVisibilityToggle;

  @override
  Widget build(BuildContext context) {
    if (useVisibilityToggle) {
      return BlocProvider(
        create: (_) => PasswordVisibilityCubit(),
        child: _PasswordTextField(
          label: label,
          hintText: hintText,
          controller: controller,
          borderRadius: borderRadius,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.xs),
            child: Text(label!, style: AppTextStyles.bodyLarge),
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral7),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColors.primary300),
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.label,
    required this.hintText,
    required this.controller,
    required this.borderRadius,
  });

  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.xs),
            child: Text(label!, style: AppTextStyles.bodyLarge),
          ),
        BlocBuilder<PasswordVisibilityCubit, bool>(
          builder: (context, visible) {
            return TextFormField(
              controller: controller,
              obscureText: !visible,
              style: AppTextStyles.bodyMedium,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral7),
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(AppSizes.md, AppSizes.md, AppSizes.xs, AppSizes.md),
                  child: AppIcon(icon: Assets.icons.lockFilled),
                ),
                suffixIcon: InkWell(
                  onTap: context.read<PasswordVisibilityCubit>().toggle,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(AppSizes.xs, AppSizes.md, AppSizes.md, AppSizes.md),
                    child: AppIcon(icon: visible ? Assets.icons.eyeFilled : Assets.icons.eyeSlashFilled),
                  ),
                ),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(color: AppColors.primary300),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
