import 'package:anamel/core/common_widgets/MainElevatedButton.dart';
import 'package:anamel/core/common_widgets/TextFormFieldWidget.dart';
import 'package:anamel/core/const/app_const.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:anamel/screens/auth/login/login_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscurePassword = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginFormKey,
        autovalidateMode: AutovalidateMode.onUnfocus,

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                SizedBox(height: 100.h),

                // welcome text
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to Anamel",
                    style: AppStyles.mainHeadingStyle,
                  ),
                ),

                SizedBox(height: 80.h),

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

                // remember me check box
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: isRememberMe,

                      onChanged: (bool? newValue) {
                        setState(() {
                          isRememberMe = newValue ?? false;
                        });
                      },

                      activeColor: Theme.of(context).colorScheme.primary,

                      checkColor: Theme.of(context).colorScheme.secondary,

                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 64.h),

                // Login Button
                MainElevatedButton(
                  textOnButton: "Login",
                  onButtonTap: () {
                    if (loginFormKey.currentState!.validate()) {
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

                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // second part of the screen
                LoginOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
