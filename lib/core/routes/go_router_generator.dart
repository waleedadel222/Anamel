import 'package:anamel/screens/auth/presentation/create_new_password.dart';
import 'package:anamel/screens/onboarding_screen.dart';
import 'package:anamel/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/auth/presentation/forget_password_screen.dart';
import '../../screens/auth/presentation/login/login_screen.dart';
import '../../screens/auth/presentation/opt_verify.dart';
import '../../screens/auth/presentation/register/register_screen.dart';
import '../../screens/settings/app_settings_screen.dart';
import 'app_routing.dart';

class GoRouterGenerator {
  static GoRouter generateRouter(String initialRoute) {
    return GoRouter(
      initialLocation: initialRoute,
      errorBuilder: (context, state) => Scaffold(
        body: Center(child: Text("This route doesn't exist ${state.error}")),
      ),
      routes: [
        // splash screen
        // GoRoute(
        //   name: AppRouting.splash,
        //   path: AppRouting.splash,
        //   builder: (context, state) => const SplashScreen(),
        // ),

        // onboarding screen
        GoRoute(
          name: AppRouting.onboarding,
          path: AppRouting.onboarding,
          builder: (context, state) => const OnboardingScreen(),
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
          builder: (context, state) => const ForgetPasswordScreen(),
        ),

        // New Password screen
        GoRoute(
          name: AppRouting.createNewPassword,
          path: AppRouting.createNewPassword,
          builder: (context, state) => const CreateNewPassword(),
        ),

        // OptVerify screen
        GoRoute(
          name: AppRouting.otpVerification,
          path: AppRouting.otpVerification,
          builder: (context, state) => const OptVerify(),
        ),

        // home screen
        GoRoute(
          name: AppRouting.home,
          path: AppRouting.home,
          builder: (context, state) => const Placeholder(),
        ),

        // cart
        GoRoute(
          name: AppRouting.cart,
          path: AppRouting.cart,
          builder: (context, state) =>
              // CartScreen(productId: 22, productName:  state.extra as String),
              Placeholder(),
        ),

        // category
        GoRoute(
          name: AppRouting.categories,
          path: AppRouting.categories,
          builder: (context, state) => const Placeholder(),
        ),

        // profile
        GoRoute(
          name: AppRouting.profile,
          path: AppRouting.profile,
          builder: (context, state) => const ProfileScreen(userData: {}),
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
}
