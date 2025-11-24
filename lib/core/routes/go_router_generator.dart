import 'package:anamel/screens/address/addresses_screen.dart';
import 'package:anamel/screens/create_new_password.dart';
import 'package:anamel/screens/main/main_screen.dart';
import 'package:anamel/screens/onboarding_screen.dart';
import 'package:anamel/screens/main/profile_screen.dart';
import 'package:anamel/screens/order_history.dart';
import 'package:anamel/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../screens/address/add_new_address.dart';
import '../../screens/auth/presentation/forget_password_screen.dart';
import '../../screens/auth/presentation/login/login_screen.dart';
import '../../screens/auth/presentation/opt_verify.dart';
import '../../screens/auth/presentation/register/register_screen.dart';
import '../../screens/app_settings_screen.dart';
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
        builder: (context, state) => SplashScreen(),
      ),

      // onboarding screen
      GoRoute(
        name: AppRouting.onboarding,
        path: AppRouting.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),

      // login screen
      GoRoute(
        name: AppRouting.login,
        path: AppRouting.login,
        builder: (context, state) => LoginScreen(),
      ),

      // register screen
      GoRoute(
        name: AppRouting.register,
        path: AppRouting.register,
        builder: (context, state) => RegisterScreen(),
      ),

      // forgot Password screen
      GoRoute(
        name: AppRouting.forgotPassword,
        path: AppRouting.forgotPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),

      // New Password screen
      GoRoute(
        name: AppRouting.createNewPassword,
        path: AppRouting.createNewPassword,
        builder: (context, state) => CreateNewPassword(),
      ),

      // OptVerify screen
      GoRoute(
        name: AppRouting.otpVerification,
        path: AppRouting.otpVerification,
        builder: (context, state) => OptVerify(),
      ),

      // main screen
      GoRoute(
        name: AppRouting.main,
        path: AppRouting.main,
        builder: (context, state) => MainScreen(),
      ),

      // home screen
      GoRoute(
        name: AppRouting.home,
        path: AppRouting.home,
        builder: (context, state) => SplashScreen(),
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
        builder: (context, state) => SplashScreen(),
      ),

      // profile
      GoRoute(
        name: AppRouting.profile,
        path: AppRouting.profile,
        builder: (context, state) => ProfileScreen(),
      ),

      // settings
      GoRoute(
        name: AppRouting.settings,
        path: AppRouting.settings,
        builder: (context, state) => AppSettingsScreen(),
      ),

      // order history
      GoRoute(
        name: AppRouting.orderHistory,
        path: AppRouting.orderHistory,
        builder: (context, state) => OrderHistory(),
      ),

      // addresses
      GoRoute(
        name: AppRouting.addresses,
        path: AppRouting.addresses,
        builder: (context, state) => AddressesScreen(),
      ),

      // new address
      GoRoute(
        name: AppRouting.addAddress,
        path: AppRouting.addAddress,
        builder: (context, state) => AddNewAddress(),
      ),
    ],
  );
}
