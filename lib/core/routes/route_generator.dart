import 'package:anamel/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_routing.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // home
      case AppRouting.home:
        return MaterialPageRoute(builder: (context) => SplashScreen());

        //cart
      case AppRouting.cart:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          // SplashScreen(productId: 22,
          //   productName: settings.arguments as String,
          // ),
        );

        // settings
      case AppRouting.settings:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: RouteSettings(
            name: "argName",
            arguments: settings.arguments as String,
          ),
        );

        // error routing
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}
