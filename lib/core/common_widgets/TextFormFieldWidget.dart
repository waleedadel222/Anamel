import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final double? width;
  final double? height;

  final TextEditingController? controller;
  final FormFieldValidator? validator;

  final double? fontSize;
  final FontWeight? fontWeight;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool? isObscureText;

  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.width,
    this.height,
    this.controller,
    this.validator,
    this.fontSize,
    this.fontWeight,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: height ?? 80.h,
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        validator: validator,
        autofocus: false,
        cursorColor: Theme.of(context).colorScheme.primary,
        obscureText: isObscureText ?? false,

        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 14.h,
          ),

          // hintText: hintText,
          // hintStyle: TextStyle(
          //   color: AppColors.primaryColor,
          //   fontSize: fontSize ?? 14.sp,
          //   fontWeight: fontWeight ?? FontWeight.w400,
          // ),
          labelText: hintText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: fontSize ?? 12.sp,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),

          filled: true,

          // fillColor: AppColors.wightColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.w,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.w,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.w,
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.w,
            ),
          ),
        ),
      ),
    );
  }
}
