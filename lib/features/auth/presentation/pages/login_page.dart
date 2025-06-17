import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/resources/styles/app_text_styles.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:credix_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:credix_app/features/auth/presentation/blocs/remember_me/remember_me_cubit.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginBloc>()..add(const LoginEvent.loadSavedCredentials())),
        BlocProvider(create: (context) => getIt<RememberMeCubit>()),
      ],
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            credentialsLoaded: (username, password, rememberMe) {
              emailController.text = username;
              passwordController.text = password;
              context.read<RememberMeCubit>().setRemember(remember: rememberMe);
            },
          );
        },
        builder: (context, state) {
          return KeyboardAwareScaffold(
            child: Column(
              children: [
                const SizedBox(height: AppSizes.huge),
                const LogoBadge(),
                const SizedBox(height: AppSizes.md),
                const AppText.h1('Welcome!'),
                const SizedBox(height: AppSizes.xs),
                const AppText.labelMedium(
                  'Enter your email and password to continue.',
                  color: AppColors.neutral7,
                ),
                const SizedBox(height: AppSizes.xxl),
                AppTextField.standard(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(AppSizes.md, AppSizes.md, AppSizes.sm, AppSizes.md),
                    child: AppIcon(icon: Assets.icons.emailFilled),
                  ),
                ),
                const SizedBox(height: AppSizes.md),
                AppTextField.password(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                const SizedBox(height: AppSizes.xs),
                Row(
                  children: [
                    BlocBuilder<RememberMeCubit, RememberMeState>(
                      builder: (context, state) {
                        return Checkbox(
                          value: state.remember,
                          activeColor: AppColors.primary500,
                          side: const BorderSide(color: AppColors.primary500, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.xs),
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          onChanged: (_) => context.read<RememberMeCubit>().toggle(),
                        );
                      },
                    ),
                    const Text('Remember me'),
                  ],
                ),
                const SizedBox(height: AppSizes.xl),
                state.maybeWhen(
                  orElse: () {
                    return AppButton(
                      content: const AppText.labelMedium(
                        'Sign In',
                        color: AppColors.neutral1,
                      ),
                      onPressed: () {
                        final isRemembering = context.read<RememberMeCubit>().isRemembering;
                        context.read<LoginBloc>().add(
                              LoginEvent.login(
                                rememberMe: isRemembering,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      },
                    );
                  },
                  loading: () {
                    return const AppButton(
                      enabled: false,
                      content: FadingCircularProgress(),
                    );
                  },
                ),
                const SizedBox(height: AppSizes.md),
                AppText.labelMedium(
                  'Forgot Password?',
                  color: AppColors.neutral7,
                  onTap: () => getIt<AppRouter>().push(ForgotPasswordRoute()),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSizes.jumbo),
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: AppTextStyles.labelLarge,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: AppTextStyles.labelLarge.copyWith(
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
