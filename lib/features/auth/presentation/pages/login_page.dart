import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/resources/styles/app_text_styles.dart';
import 'package:credix_app/core/presentation/widgets/common/app_scaffold.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return AppScaffold(
            child: Column(
              children: [
                const SizedBox(height: AppSizes.s48),
                const LogoWrapper(),
                const SizedBox(height: AppSizes.md),
                const AppText.headlineLarge('Welcome!'),
                const SizedBox(height: AppSizes.xs),
                const AppText.bodyMedium(
                  'Enter your account',
                  color: AppColors.neutral6,
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
                const SizedBox(height: AppSizes.md),
                AppTextField.password(
                  controller: passwordController,
                  label: 'Password',
                  hintText: 'Password',
                ),
                const SizedBox(height: AppSizes.lg),
                AppButton(
                  buttonText: 'Sign In',
                  onPressed: () => context
                      .read<LoginBloc>()
                      .add(LoginEvent.login(email: emailController.text, password: passwordController.text)),
                ),
                const SizedBox(height: AppSizes.md),
                const AppText.labelMedium(
                  'Forgot Password?',
                  color: AppColors.neutral7,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSizes.s64),
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: AppTextStyles.bodyLarge,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.primary600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
