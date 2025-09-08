import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/features/auth/ui/login/view/login.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_screen.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/navigation_view.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/category_products.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/category_products_args.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      case Routes.navigationRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigationView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>  Login(),
        );
      case Routes.categoryProducts:
        var args = settings.arguments as CategoryProductsArgs;
        return MaterialPageRoute(builder: (_)=>
            CategoryProducts(args: args,));
      case Routes.cartRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CartScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
