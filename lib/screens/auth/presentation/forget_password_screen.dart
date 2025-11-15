import 'package:anamel/screens/auth/domain/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common_widgets/main_elevated_button.dart';
import '../../../core/common_widgets/text_form_field_widget.dart';
import '../../../core/const/app_const.dart';
import '../../../core/routes/app_routing.dart';
import '../../../core/styling/app_styles.dart';
import '../domain/auth_bloc.dart';
import '../domain/auth_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  void goToLoginScreen() {
    GoRouter.of(context).pushReplacementNamed(AppRouting.login);
  }

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
            goToLoginScreen();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is PasswordResetSuccess) {
              // go back to login screen
              goToLoginScreen();

              // show success message
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return Form(
              key: forgetFormKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
                    textOnButton: "Send Link",
                    onButtonTap: () {
                      if (forgetFormKey.currentState!.validate()) {
                        // function to send code to the email
                        context.read<AuthBloc>().add(
                          ForgotPasswordEvent(emailController.text.trim()),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
