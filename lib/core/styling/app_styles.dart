import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_fonts.dart';

class AppStyles {
  static TextStyle mainHeadingStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeadingStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  //-------- rich text
  static TextStyle richTextStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  //----------splash screen ----------

  static TextStyle logoTitleStyle = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle logoSubtitleStyle = TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 15.sp,
    fontWeight: FontWeight.w300
  );


  //-------- pin code
  static TextStyle pinCodeStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );
}
