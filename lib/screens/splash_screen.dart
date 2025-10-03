import 'package:anamel/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:anamel/styling/app_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryVariant,

      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/images/anamel_cover.jpg",
                fit: BoxFit.cover,
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Anamel", style: AppStyles.mainHeadingStyle),
                Text("Made With Love", style: AppStyles.subHeadingStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
