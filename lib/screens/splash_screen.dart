import 'package:anamel/core/const/app_assets_path.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/styling/app_styles.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goToLoginScreen(context);

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

// first time to open the app , wait 3 second then go to login screen
void goToLoginScreen(BuildContext context) {
  Future.delayed(Duration(seconds: 3), () {
    // GoRouter.of(context).pushReplacement(AppRouting.login);
    GoRouter.of(context).pushReplacement(AppRouting.forgotPassword);
  });
}

//  not the first time ,go to home screen
void goToHomeScreen(BuildContext context) {
  GoRouter.of(context).pushReplacement(AppRouting.home);
}
