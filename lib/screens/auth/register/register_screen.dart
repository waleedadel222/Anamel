import 'package:anamel/core/common_widgets/MainElevatedButton.dart';
import 'package:anamel/core/common_widgets/TextFormFieldWidget.dart';
import 'package:anamel/core/const/app_const.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:anamel/screens/auth/register/register_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final registerFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConformPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: registerFormKey,
        autovalidateMode: AutovalidateMode.onUnfocus,

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                SizedBox(height: 100.h),

                // Join text
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Join to Anamel",
                    style: AppStyles.mainHeadingStyle,
                  ),
                ),

                SizedBox(height: 80.h),

                // username text field
                TextFormFieldWidget(
                  hintText: "username",
                  textInputType: TextInputType.name,
                  controller: usernameController,

                  prefixIcon: Icon(Icons.person),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40.h),

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

                SizedBox(height: 40.h),

                // Password text field
                TextFormFieldWidget(
                  hintText: "Password",
                  controller: passwordController,
                  isObscureText: isObscurePassword,
                  prefixIcon: Icon(Icons.password),

                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),

                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 32.h),

                // confirm Password text field
                TextFormFieldWidget(
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                  isObscureText: isObscureConformPassword,
                  prefixIcon: Icon(Icons.password),

                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscureConformPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),

                    onPressed: () {
                      setState(() {
                        isObscureConformPassword = !isObscureConformPassword;
                      });
                    },
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else if (value != passwordController.text.trim()) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 64.h),

                // register Button
                MainElevatedButton(
                  textOnButton: "Register",
                  onButtonTap: () {
                    if (registerFormKey.currentState!.validate()) {
                      // go to main screen
                      GoRouter.of(context).pushNamed(AppRouting.home);
                    } else {
                      //  Validation failed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("something went wrong!")),
                      );
                    }
                  },
                ),

                SizedBox(height: 32.h),

                // second part of register screen
                RegisterOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
