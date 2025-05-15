import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardAwareScaffold(
      child: Column(
        children: [
          const AppBackButton(),
          const SizedBox(height: AppSizes.md),
          DualToneIconBadge(
            toneAccent: AppColors.primary50,
            toneBase: AppColors.primary500,
            icon: AppIcon(
              icon: Assets.icons.lockFilled,
              color: AppColors.neutral1,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          const AppText.h1('Forgot Password?'),
          const SizedBox(height: AppSizes.xxs),
          const AppText.labelMedium(
            'Enter your email to get a reset link',
            color: AppColors.neutral7,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.s40),
          AppTextField.standard(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(AppSizes.md, AppSizes.md, AppSizes.xs, AppSizes.md),
              child: AppIcon(icon: Assets.icons.emailFilled),
            ),
          ),
          const SizedBox(height: AppSizes.xl),
          AppButton(
            content: const AppText.labelMedium(
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
