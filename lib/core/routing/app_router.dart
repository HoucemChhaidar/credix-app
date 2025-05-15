import 'package:auto_route/auto_route.dart';
import 'package:credix_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:credix_app/features/auth/presentation/pages/login_page.dart';
import 'package:credix_app/features/barcode/presentation/pages/barcode_page.dart';
import 'package:credix_app/features/history/presentation/pages/history_page.dart';
import 'package:credix_app/features/home/presentation/pages/home_page.dart';
import 'package:credix_app/features/main/presentation/pages/main_page.dart';
import 'package:credix_app/features/offers/presentation/pages/offers_page.dart';
import 'package:credix_app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@Singleton()
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType {
    return RouteType.custom(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      reverseDuration: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: LoginRoute.page, initial: true),
      AutoRoute(page: ForgotPasswordRoute.page),
      AutoRoute(
        page: MainRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: HistoryRoute.page),
          AutoRoute(page: BarcodeRoute.page),
          AutoRoute(page: OffersRoute.page),
          AutoRoute(page: SettingsRoute.page),
        ],
      ),
    ];
  }
}
