import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GoogleButton extends StatelessWidget {
  final String textOnButton;
  final Function? onButtonTap;

  const GoogleButton({super.key, required this.textOnButton, this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onButtonTap as Function()?,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5.w,
          ),
        ),
      ),
      icon: SvgPicture.asset(
        "assets/icons/google_ic.svg",
        height: 24.h,
        width: 24.w,
      ),
      label: Text(textOnButton, style: TextStyle(fontSize: 14.sp)),
    );
  }
}
