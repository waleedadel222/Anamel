import 'package:anamel/styling/app_colors.dart';
import 'package:anamel/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // logo and title container
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset("name"),
            Icon(
              Icons.navigation_outlined,
              color: AppColors.wightColor,
              size: 25.sp,
            ),
            Text(
              "Amanel",
              style: AppStyles.mainHeadingStyle.copyWith(
                color: AppColors.wightColor,
              ),
            ),
          ],
        ),

        // content container
        Column(


        ),
      ],
    );
  }
}
