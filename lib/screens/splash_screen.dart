// import 'package:anamel/core/const/app_assets_path.dart';
// import 'package:anamel/core/routes/app_routing.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lottie/lottie.dart';
// import '../core/styling/app_styles.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _startSplashTimer();
//   }
//
//   void _startSplashTimer() {
//     Future.delayed(const Duration(milliseconds: 2500), () {
//       _checkFirstTime();
//     });
//   }
//
//   void _checkFirstTime() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstTime = prefs.getBool("is_first_time") ?? true;
//
//     if (isFirstTime) {
//       prefs.setBool("is_first_time", false);
//       // go to onboarding screen
//       if (mounted) {
//         GoRouter.of(context).pushReplacement(AppRouting.onboarding);
//       }
//     } else {
//       // check user login status
//       _checkUser();
//     }
//   }
//
//   void _checkUser() {
//     final user = FirebaseAuth.instance.currentUser;
//
//     if (mounted) {
//       if (user != null) {
//         GoRouter.of(context).pushReplacement(AppRouting.home);
//       } else {
//         GoRouter.of(context).pushReplacement(AppRouting.login);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Lottie Animation
//             Lottie.asset(
//               AppAssetsPath.splashLogo,
//               width: 250,
//               height: 250,
//               fit: BoxFit.contain,
//             ),
//             const SizedBox(height: 24),
//             // App Name
//             Text(
//               "Anamel",
//               style: AppStyles.logoTitleStyle.copyWith(
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//             const SizedBox(height: 8),
//             // Subtitle
//             Text(
//               "Made With Love",
//               style: AppStyles.logoSubtitleStyle.copyWith(
//                 color: Theme.of(context).colorScheme.secondary,
//               ),
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
