import 'package:anamel/core/common_widgets/main_elevated_button.dart';
import 'package:anamel/core/common_widgets/text_form_field_widget.dart';
import 'package:anamel/core/const/app_const.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/rich_text_widget.dart';
import '../../domain/auth_bloc.dart';
import '../../domain/auth_event.dart';
import '../../domain/auth_state.dart';

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

            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthAuthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Successful')),
                  );
                  // go to main screen
                  GoRouter.of(context).pushReplacementNamed(AppRouting.main);
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },

              builder: (context, state) {
                bool isLoading = state is AuthLoading;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    SizedBox(height: 70.h),

                    // welcome text
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome to Anamel",
                        style: AppStyles.mainHeadingStyle,
                      ),
                    ),

                    SizedBox(height: 64.h),

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
                        }
                        // } else if (!AppConst.isValidPassword(value)) {
                        //   return "Password should has at least 8 characters,\n"
                        //       "an uppercase letter,a lowercase letter,\n and a number";
                        // }
                        return null;
                      },
                    ),

                    SizedBox(height: 32.h),

                    // Login Button
                    MainElevatedButton(
                      textOnButton: "Login",

                      onButtonTap: isLoading
                          ? null // disable button when loading
                          : () {
                              if (loginFormKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  LoginRequested(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                    ),

                    // show loading indicator while logging in
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        ),
                      ),

                    SizedBox(height: 32.h),

                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          // go to forgetPassword screen
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouting.forgotPassword);
                        },
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

                    SizedBox(height: 32.h),

                    // second part of the screen
                    // LoginOptions(),
                    // do not have account ?
                    RichTextWidget(
                      mainText: "Don’t have an account? ",
                      subText: "Sign Up",
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRouting.register);
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
