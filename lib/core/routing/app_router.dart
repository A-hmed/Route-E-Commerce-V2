import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/utils/dialog_utils.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_state.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_screen.dart';
import 'package:route_e_commerce_v2/features/auth/ui/login/view/login.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/navigation_view.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/category_products.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/category_productsArgs.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/');
    Widget currentScreen;
    switch (uri.path) {
      case Routes.navigationRoute:
        currentScreen = const NavigationView();
      case Routes.loginRoute:
        currentScreen = Login();
      case Routes.categoryProductsRoutes:
        final args = settings.arguments as CategoryProductArgs;
        currentScreen = CategoryProducts(
          categoryId: args.categoryId,
          subCategoryId: args.subCategoryId,
        );
      case Routes.cartRoute:
        currentScreen = const CartScreen();
      default:
        currentScreen = const Scaffold(
          body: Center(child: Text('404 - Page Not Found')),
        );
    }
    return MaterialPageRoute(
      builder: (_) => BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state.cartApiState.isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        child: currentScreen,
      ),
    );
  }
}
