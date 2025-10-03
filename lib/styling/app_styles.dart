import 'package:anamel/styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppStyles {

  static TextStyle mainHeadingStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle subHeadingStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryVariant,
  );

  static TextStyle cardHeadingStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle cardSubHeadingStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryLight,
  );
}
