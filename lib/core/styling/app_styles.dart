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
}
