import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/app_router.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';
import 'package:route_e_commerce_v2/features/network%20/api_services.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  var isLoggedIn = (await getIt<SharedPrefsHelper>().getToken()) != null;
  runApp(MyApp(isLoggedIn: isLoggedIn,));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Route E-Commerce",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: isLoggedIn? Routes.navigationRoute: Routes.loginRoute,
    );
  }
}

///Widget -> VM -> Usecase -> Repo -> Data source
