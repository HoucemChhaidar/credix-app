import 'package:auto_route/auto_route.dart';
import 'package:credix_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:credix_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        reverseDuration: const Duration(milliseconds: 200),
        duration: const Duration(milliseconds: 200),
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: ForgotPasswordRoute.page),
      ];
}
