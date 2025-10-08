import 'package:financeapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text,
    this.color,
    this.width,
    this.height,
    this.border,
    this.textColor,
    this.onPressed,
    this.fontSize,
  });
  final String? text;
  final Color? color;
  final double? width;
  final double? height;
  final double? border;
  final Color? textColor;
  final void Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColor.praimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        text ?? "",
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}
