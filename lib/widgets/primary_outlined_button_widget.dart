import 'package:financeapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  const PrimaryOutlinedButtonWidget({
    super.key,
    this.text,
    this.borderColor,
    this.width,
    this.height,
    this.border,
    this.textColor,
    this.onPressed,
    this.fontSize,
  });
  final String? text;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? border;
  final Color? textColor;
  final void Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,

      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor ?? AppColor.praimaryColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        text ?? "",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor ?? AppColor.praimaryColor,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}
