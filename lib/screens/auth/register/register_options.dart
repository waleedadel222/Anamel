import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routing.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //---------- or register with------------
        Row(
          children: [
            Expanded(child: Divider(thickness: 1.5.h)),

            SizedBox(width: 12.w),

            Text(
              "Or Register with",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),

            SizedBox(width: 12.w),

            Expanded(child: Divider(thickness: 1.5.h)),
          ],
        ),

        SizedBox(height: 24.h),

        // Google Button
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),

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
            height: 64.h,
            width: 64.w,
          ),
          label: Text("Register with Google", style: TextStyle(fontSize: 14.sp)),
        ),

        SizedBox(height: 64.h),

        // already have account ?
        Center(
          child: InkWell(
            onTap: () {
              // go to register screen
              GoRouter.of(context).pushNamed(AppRouting.login);
            },
            child: RichText(
              text: TextSpan(
                text: "already have account ? ",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface),

                children: [
                  TextSpan(
                    text: "Login",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 24.h),
      ],
    );
  }
}
