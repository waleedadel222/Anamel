import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onTap, required this.iconPath});
  final VoidCallback? onTap;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 105.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xffE8ECF4)),
        ),
        child: Center(
          child: SvgPicture.asset(iconPath, width: 12.w, height: 24),
        ),
      ),
    );
  }
}
