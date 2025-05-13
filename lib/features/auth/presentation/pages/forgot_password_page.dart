import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: [
          const SizedBox(height: AppSizes.xs),
          Align(
            alignment: Alignment.centerLeft,
            child: AppBackButton(onTap: getIt<AppRouter>().back),
          ),
          DualToneIconBadge(
            toneAccent: AppColors.primary50,
            toneBase: AppColors.primary500,
            icon: AppIcon(
              icon: Assets.icons.lockFilled,
              color: AppColors.neutral1,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          const AppText.headlineLarge('Forgot Password?'),
          const SizedBox(height: AppSizes.xs),
          const AppText.bodyMedium(
            '''Enter the email associated with your account and we’ll send an email to reset your password''',
            color: AppColors.neutral6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.s40),
          AppTextField.standard(
            controller: emailController,
            label: 'Email',
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(AppSizes.md, AppSizes.md, AppSizes.xs, AppSizes.md),
              child: AppIcon(icon: Assets.icons.emailFilled),
            ),
          ),
          const SizedBox(height: AppSizes.lg),
          AppButton(
            content: const AppText.bodyMedium(
              'Send Email',
              color: AppColors.neutral1,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
