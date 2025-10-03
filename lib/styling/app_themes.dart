import 'package:anamel/styling/app_colors.dart';
import 'package:anamel/styling/app_fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {

    // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppFonts.primaryFont,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryColor,
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



  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppFonts.primaryFont,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryColor,
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
