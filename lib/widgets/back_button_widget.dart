import 'package:financeapp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 41.h,
        width: 41.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xffE8ECF4)),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Icon(icon, color: AppColor.praimaryColor),
          ),
        ),
      ),
    );
  }
}
