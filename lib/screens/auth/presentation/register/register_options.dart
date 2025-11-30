import 'package:anamel/screens/auth/presentation/auth_widget/divider_line.dart';
import 'package:anamel/screens/auth/presentation/auth_widget/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/rich_text_widget.dart';
import '../../../../core/routes/app_routing.dart';



class RegisterOptions extends StatelessWidget {
  const RegisterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //---------- or register with------------
        DividerLine(title: "Or Register with"),

        SizedBox(height: 24.h),

        // Google Button
        GoogleButton(textOnButton: "Register with Google", onButtonTap: () {}),

        SizedBox(height: 32.h),

        // already have account ?
        RichTextWidget(
          mainText: "already have account ? ",
          subText: "Login",
          onTap: () {
            GoRouter.of(context).pushReplacementNamed(AppRouting.login);
          },
        ),

        SizedBox(height: 24.h),
      ],
    );
  }
}
