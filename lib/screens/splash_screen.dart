import 'package:anamel/core/routes/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/styling/app_colors.dart';
import '../core/styling/app_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    goToLoginScreen(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/anamel_cover.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Anamel", style: AppStyles.mainHeadingStyle),
              Text("Made With Love", style: AppStyles.subHeadingStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// first time to open the app , wait 3 second then go to login screen
void goToLoginScreen(BuildContext context) {
  Future.delayed(Duration(seconds: 3), () {
    // GoRouter.of(context).pushReplacement(AppRouting.login);
    GoRouter.of(context).pushReplacement(AppRouting.register);
  });
}

//  not the first time ,go to home screen
void goToHomeScreen(BuildContext context) {
  GoRouter.of(context).pushReplacement(AppRouting.home);
}
