import 'package:anamel/styling/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // static final lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   primaryColor: AppColors.primaryColor,
  //   scaffoldBackgroundColor: AppColors.backgroundColor,
  //   appBarTheme: const AppBarTheme(
  //     color: AppColors.primaryColor,
  //     centerTitle: true,
  //   ),
  //
  //   hintColor: AppColors.grayColor,
  //
  //   // fontFamily:your fontFamily,
  //   textTheme: TextTheme(
  //     titleLarge: AppStyles.mainHeadingStyle,
  //     titleMedium: AppStyles.subHeadingStyle,
  //   ),
  //
  //   buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor),
  // );
  //
  // // static final darkTheme = ThemeData.dark();
  //
  // static final ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: AppColors.primaryColor,
  //   scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  //   appBarTheme: const AppBarTheme(
  //     color: AppColors.primaryColor,
  //     centerTitle: true,
  //   ),
  //
  //   hintColor: AppColors.whiteColor,
  //
  //   textTheme: TextTheme(
  //     titleLarge: AppStyles.mainHeadingStyle,
  //     titleMedium: AppStyles.subHeadingStyle,
  //   ),
  //
  //   buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor),
  // );

  // 🎨 Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textSecondaryLight,
      error: AppColors.errorLight,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // 🌙 Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textSecondaryDark,
      error: AppColors.errorDark,
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
