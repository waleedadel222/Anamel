import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppThemes {
  // light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightThemeColors.primaryColor,
    scaffoldBackgroundColor: LightThemeColors.background,
    fontFamily: AppFonts.primaryFont,

    dividerColor: LightThemeColors.dividerColor,

    iconTheme: IconThemeData(color: LightThemeColors.lightHint),

    colorScheme: ColorScheme.light(
      primary: LightThemeColors.primaryColor,
      onPrimary: LightThemeColors.onPrimary,

      secondary: LightThemeColors.secondaryColor,
      onSecondary: LightThemeColors.onSecondary,

      surface: LightThemeColors.surface,
      onSurface: LightThemeColors.onSurface,

      error: LightThemeColors.error,
      onError: LightThemeColors.onError,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: LightThemeColors.primaryColor,
      foregroundColor: LightThemeColors.onPrimary,
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: LightThemeColors.lightText, fontSize: 18.sp),
      bodyMedium: TextStyle(color: LightThemeColors.lightText, fontSize: 16.sp),
      titleLarge: TextStyle(
        color: LightThemeColors.lightText,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightThemeColors.primaryColor,
        foregroundColor: LightThemeColors.onPrimary,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: LightThemeColors.primaryColor, width: 1.5.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: LightThemeColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: LightThemeColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: LightThemeColors.secondaryColor,
          width: 2,
        ),
      ),
      hintStyle: TextStyle(color: LightThemeColors.lightHint),
    ),
  );

  //-------------------------------------------

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkThemeColors.primaryColor,
    scaffoldBackgroundColor: DarkThemeColors.background,

    dividerColor: DarkThemeColors.dividerColor,

    iconTheme: IconThemeData(color: DarkThemeColors.darkHint),
    colorScheme: ColorScheme.dark(
      primary: DarkThemeColors.primaryColor,
      onPrimary: DarkThemeColors.onPrimary,

      secondary: DarkThemeColors.secondaryColor,
      onSecondary: DarkThemeColors.onSecondary,

      surface: DarkThemeColors.surface,
      onSurface: DarkThemeColors.onSurface,

      error: DarkThemeColors.error,
      onError: DarkThemeColors.onError,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: DarkThemeColors.surface,
      foregroundColor: DarkThemeColors.onSurface,
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: DarkThemeColors.darkText, fontSize: 18.sp),
      bodyMedium: TextStyle(color: DarkThemeColors.darkText, fontSize: 16.sp),
      titleLarge: TextStyle(
        color: DarkThemeColors.darkText,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkThemeColors.primaryColor,
        foregroundColor: DarkThemeColors.onPrimary,

        shape: RoundedRectangleBorder(
          side: BorderSide(color: DarkThemeColors.primaryColor, width: 1.5.w),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DarkThemeColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        borderSide: BorderSide(color: DarkThemeColors.secondaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkThemeColors.primaryColor, width: 2),
      ),
      hintStyle: TextStyle(color: DarkThemeColors.darkHint),
    ),
  );
}
