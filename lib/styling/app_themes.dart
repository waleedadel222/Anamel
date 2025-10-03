import 'package:anamel/styling/app_colors.dart';
import 'package:anamel/styling/app_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      centerTitle: true,
    ),

    hintColor: AppColors.grayColor,

    // fontFamily:your fontFamily,
    textTheme: TextTheme(
      titleLarge: AppStyles.mainHeadingStyle,
      titleMedium: AppStyles.subHeadingStyle,
    ),

    buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor),
  );

  // static final darkTheme = ThemeData.dark();

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      centerTitle: true,
    ),

    hintColor: AppColors.whiteColor,

    textTheme: TextTheme(
      titleLarge: AppStyles.mainHeadingStyle,
      titleMedium: AppStyles.subHeadingStyle,
    ),

    buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor),
  );
}
