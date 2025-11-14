import 'package:anamel/core/const/app_assets_path.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/styling/app_styles.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    GoRouter.of(context).pushReplacement(AppRouting.register);

    // if (await _checkFirstTime()) {
    //   // Navigate to onboarding screen
    //   Future.delayed(Duration(seconds: 2), () {
    //     GoRouter.of(context).pushReplacement(AppRouting.onboarding);
    //   });
    // } else {
    //   _checkUser();
    // }
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool("is_first_time") ?? true;

    if (isFirstTime) {
      prefs.setBool("is_first_time", false);
      return true;
    } else {
      return false;
    }
  }

  void _checkUser() {
    final user = FirebaseAuth.instance.currentUser;
    // return user != null ? true : false;

    Future.delayed(Duration(seconds: 2), () {
      if (user != null) {
        GoRouter.of(context).pushReplacement(AppRouting.home);
      } else {
        GoRouter.of(context).pushReplacement(AppRouting.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Svg(AppAssetsPath.anamelCoverImage),
          fit: BoxFit.fitHeight,
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Anamel",
                style: AppStyles.logoTitleStyle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                "Made With Love ",
                style: AppStyles.logoSubtitleStyle.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
