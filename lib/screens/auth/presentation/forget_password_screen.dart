import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common_widgets/MainElevatedButton.dart';
import '../../../core/common_widgets/TextFormFieldWidget.dart';
import '../../../core/const/app_const.dart';
import '../../../core/routes/app_routing.dart';
import '../../../core/styling/app_styles.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final forgetFormKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(AppRouting.login);
          },
        ),
      ),

      body: Form(
        key: forgetFormKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // forget title text
                  Text(
                    "Forget Your Password ?",
                    style: AppStyles.mainHeadingStyle,
                  ),

                  SizedBox(height: 12.h),

                  // sub title
                  Text(
                    "Don't worry! Just enter the email address linked with your account.",
                    style: AppStyles.subHeadingStyle,
                  ),

                  SizedBox(height: 32.h),

                  // email text field
                  TextFormFieldWidget(
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Icon(Icons.email_outlined),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!AppConst.isValidEmail(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 32.h),

                  // send code Button
                  MainElevatedButton(
                    textOnButton: "Send Code",
                    onButtonTap: () {
                      if (forgetFormKey.currentState!.validate()) {
                        // function to send code to the email
                        // then navigate to verify screen
                      } else {
                        //  Validation failed
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("something went wrong!"),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
