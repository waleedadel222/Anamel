import 'package:anamel/screens/auth/login/login_screen.dart';
import 'package:anamel/screens/auth/register/register_screen.dart';
import 'package:anamel/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../screens/settings/app_settings_screen.dart';
import 'app_routing.dart';

class GoRouterGenerator {
  static GoRouter mainRouter = GoRouter(
    initialLocation: AppRouting.splash,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text("This route doesn't exist ${state.error}")),
    ),
    routes: [
      // splash screen
      GoRoute(
        name: AppRouting.splash,
        path: AppRouting.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // login screen
      GoRoute(
        name: AppRouting.login,
        path: AppRouting.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // register screen
      GoRoute(
        name: AppRouting.register,
        path: AppRouting.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      // forgot Password screen
      GoRoute(
        name: AppRouting.forgotPassword,
        path: AppRouting.forgotPassword,
        builder: (context, state) => const SplashScreen(),
      ),

      // home screen
      GoRoute(
        name: AppRouting.home,
        path: AppRouting.home,
        builder: (context, state) => const SplashScreen(),
      ),

      // cart
      GoRoute(
        name: AppRouting.cart,
        path: AppRouting.cart,
        builder: (context, state) =>
            // CartScreen(productId: 22, productName:  state.extra as String),
            SplashScreen(),
      ),

      // category
      GoRoute(
        name: AppRouting.categories,
        path: AppRouting.categories,
        builder: (context, state) => const SplashScreen(),
      ),

      // setting
      GoRoute(
        name: AppRouting.settings,
        path: AppRouting.settings,
        builder: (context, state) => const AppSettingsScreen(),
      ),
    ],
  );
}
