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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final registerFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
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
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthAuthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Register Successful')),
                  );
                  // // go to main screen
                  // GoRouter.of(context).pushReplacementNamed(AppRouting.main);

                  // go to OTP screen
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouting.otpVerification);
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

                    // Join text
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Join to Anamel",
                        style: AppStyles.mainHeadingStyle,
                      ),
                    ),

                    SizedBox(height: 48.h),

                    // first name text field
                    TextFormFieldWidget(
                      hintText: "First Name",
                      textInputType: TextInputType.name,
                      controller: firstNameController,
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.h),

                    // last name text field
                    TextFormFieldWidget(
                      hintText: "Last Name",
                      textInputType: TextInputType.name,
                      controller: lastNameController,
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.h),

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

                    SizedBox(height: 20.h),

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

                    SizedBox(height: 20.h),

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
                            isObscureConformPassword =
                                !isObscureConformPassword;
                          });
                        },
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value != passwordController.text.trim()) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.h),

                    // register Button
                    MainElevatedButton(
                      textOnButton: "Register",
                      onButtonTap: isLoading
                          ? null
                          : () {
                              // if (registerFormKey.currentState!.validate()) {
                              //   context.read<AuthBloc>().add(
                              //     RegisterRequested(
                              //       email: emailController.text.trim(),
                              //       password: passwordController.text,
                              //       passwordConfirmation:
                              //           confirmPasswordController.text,
                              //       firstName: firstNameController.text.trim(),
                              //       lastName: lastNameController.text.trim(),
                              //     ),
                              //   );
                              // }
                              GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRouting.main);
                            },
                    ),

                    // show loading indicator while register
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        ),
                      ),

                    SizedBox(height: 20.h),

                    // second part of register screen
                    // RegisterOptions(),

                    // already have account ?
                    RichTextWidget(
                      mainText: "already have account ? ",
                      subText: "Login",
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRouting.login);
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
