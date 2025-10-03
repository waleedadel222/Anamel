import 'package:anamel/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routing.dart';

class GoRouterGenerator {
  static GoRouter mainRouter = GoRouter(
    initialLocation: AppRouting.splash,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text("This route doesn't exist ${state.error}")),
    ),
    routes: [
      GoRoute(
        name: AppRouting.splash,
        path: AppRouting.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: AppRouting.home,
        path: AppRouting.home,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: AppRouting.cart,
        path: AppRouting.cart,
        builder: (context, state) =>
            // CartScreen(productId: 22, productName:  state.extra as String),
            SplashScreen(),
      ),
      GoRoute(
        name: AppRouting.categories,
        path: AppRouting.categories,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
