import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/theme/app_theme.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:credix_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Credix App',
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: AutoRouterDelegate(getIt<AppRouter>()),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
    );
  }
}
