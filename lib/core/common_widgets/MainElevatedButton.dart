import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';

class MainElevatedButton extends StatelessWidget {
  final String textOnButton;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final Function? onButtonTap;
  final double? width;
  final double? height;
  final double? borderRadius;

  const MainElevatedButton({
    super.key,
    required this.textOnButton,
    this.textFontSize,
    this.textFontWeight,
    this.onButtonTap,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonTap as Function()?,

      style: ElevatedButton.styleFrom(
        // backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        ),
      ),
      child: Text(
        textOnButton,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: textFontSize ?? 20.sp,
          fontWeight: textFontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}
