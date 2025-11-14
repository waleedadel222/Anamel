import 'package:anamel/screens/auth/presentation/auth_widget/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_routing.dart';
import '../../../../core/common_widgets/rich_text_widget.dart';
import '../auth_widget/divider_line.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //---------- or login with------------
        DividerLine(title: "Or Login with"),

        SizedBox(height: 24.h),

        // Google Button
        GoogleButton(textOnButton: "Login with Google", onButtonTap: () {}),

        SizedBox(height: 48.h),

        // do not have account ?
        RichTextWidget(
          mainText: "Don’t have an account? ",
          subText: "Sign Up",
          onTap: () {
            GoRouter.of(context).pushReplacementNamed(AppRouting.register);
          },
        ),

        SizedBox(height: 24.h),
      ],
    );
  }
}
