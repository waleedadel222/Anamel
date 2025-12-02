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

  static TextStyle richTextStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );


  static TextStyle logoTitleStyle = TextStyle(
    fontFamily: AppFonts.poppinsFont,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle logoSubtitleStyle = TextStyle(
    fontFamily: AppFonts.poppinsFont,
    fontSize: 15.sp,
    fontWeight: FontWeight.w300
  );

//---- Cart
  static TextStyle bodyStyle=TextStyle(
    fontFamily: AppFonts.cairoFont,
    fontSize: 18
  );

  static TextStyle smallCaptionStyle = TextStyle(
    fontFamily: AppFonts.cairoFont,
    fontSize: 16.sp,
  );




  //-------- pin code
  static TextStyle pinCodeStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle text18BoldStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle text14BoldStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle text16NormalStyle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );
}
