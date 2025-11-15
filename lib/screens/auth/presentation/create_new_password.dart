import 'package:anamel/core/const/app_assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common_widgets/main_elevated_button.dart';
import '../../../core/common_widgets/text_form_field_widget.dart';
import '../../../core/routes/app_routing.dart';
import '../../../core/styling/app_styles.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPassword();
}

class _CreateNewPassword extends State<CreateNewPassword> {
  final updatePassFormKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConformPassword = true;

  @override
  Widget build(BuildContext context) {
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
        key: updatePassFormKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // title text
                  Text("Create New Password", style: AppStyles.logoTitleStyle),

                  SizedBox(height: 28.h),

                  // Password text field
                  TextFormFieldWidget(
                    hintText: "Enter Your Password",
                    controller: passwordController,
                    isObscureText: isObscurePassword,

                    // lock icon
                    prefixIcon: Icon(Icons.password),

                    // eye icons - open and close
                    suffixIcon: IconButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.h,
                      ),
                      icon: isObscurePassword
                          ? SvgPicture.asset(
                              AppAssetsPath.passwordCloseEyeIcon,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onSurface,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              AppAssetsPath.passwordOpenEyeIcon,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onSurface,
                                BlendMode.srcIn,
                              ),
                            ),

                      onPressed: () {
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      },
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 32.h),

                  // confirm Password text field
                  TextFormFieldWidget(
                    hintText: "Confirm your Password",
                    controller: confirmPasswordController,
                    isObscureText: isObscureConformPassword,
                    prefixIcon: Icon(Icons.password),

                    suffixIcon: IconButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.h,
                      ),
                      icon: isObscureConformPassword
                          ? SvgPicture.asset(
                              AppAssetsPath.passwordCloseEyeIcon,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onSurface,
                                BlendMode.srcIn,
                              ),
                            )
                          : SvgPicture.asset(
                              AppAssetsPath.passwordOpenEyeIcon,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onSurface,
                                BlendMode.srcIn,
                              ),
                            ),

                      onPressed: () {
                        setState(() {
                          isObscureConformPassword = !isObscureConformPassword;
                        });
                      },
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      } else if (value != passwordController.text.trim()) {
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 48.h),

                  // create password Button
                  MainElevatedButton(
                    textOnButton: "Create Password",
                    onButtonTap: () {
                      if (updatePassFormKey.currentState!.validate()) {
                        // go to login screen
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRouting.login);
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
