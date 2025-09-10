import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/app_router.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/shared_pref_helper/shared_pref_helper.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';
import 'package:route_e_commerce_v2/core/utils/dialog_utils.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_state.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  var prefHelper = getIt<SharedPrefHelper>();
  var isLoggedIn = (await prefHelper.getToken()) != null;
  runApp(
    BlocProvider(
      create: (_) => getIt<CartCubit>(),
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      initialRoute: widget.isLoggedIn ? Routes.navigationRoute : Routes.loginRoute,
    );
  }
}

// widget -> vm -> usecase -> repo -> ds
