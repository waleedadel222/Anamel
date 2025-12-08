import 'package:anamel/core/common_widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/common_widgets/main_elevated_button.dart';

import '../../../core/routes/app_routing.dart';
import '../../../core/styling/app_styles.dart';
import '../domain/auth_bloc.dart';
import '../domain/auth_event.dart';
import '../domain/auth_state.dart';

class OptVerify extends StatefulWidget {
  final String? _email;

  const OptVerify({super.key, required String email}) : _email = email;

  @override
  State<OptVerify> createState() => _OptVerifyState();
}

class _OptVerifyState extends State<OptVerify> {
  final otpFormKey = GlobalKey<FormState>();
  final TextEditingController pinCodeController = TextEditingController();

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

      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ResetCodeSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is ResetCodeVerified) {
            // Navigate to reset password screen

            // GoRouter.of(context).pushReplacementNamed(AppRouting.);
            Navigator.of(context).pushNamed(
              '/reset-password',
              arguments: {'email': state.email, 'code': state.otp},
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Form(
            key: otpFormKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // opt title text
                      Text(
                        "OTP Verification Code",
                        style: AppStyles.mainHeadingStyle,
                      ),

                      SizedBox(height: 12.h),

                      // opt sub title
                      Text(
                        "Enter the Verification Code that sent to your email address",
                        style: AppStyles.subHeadingStyle,
                      ),

                      SizedBox(height: 32.h),

                      // pin code text
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: pinCodeController,
                        enableActiveFill: true,

                        textStyle: AppStyles.pinCodeStyle.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),

                        pinTheme: PinTheme(
                          fieldHeight: 60.h,
                          fieldWidth: 60.w,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10.r),

                          selectedColor: Theme.of(context).colorScheme.primary,
                          selectedFillColor: Theme.of(
                            context,
                          ).colorScheme.surface,

                          activeColor: Theme.of(context).colorScheme.onSurface,
                          activeFillColor: Theme.of(
                            context,
                          ).colorScheme.surface,

                          inactiveColor: Theme.of(context).dividerColor,
                          inactiveFillColor: Theme.of(
                            context,
                          ).dividerColor.withValues(alpha: 0.1),
                        ),
                        onCompleted: (pinValue) {
                          // call verify function with the entered code

                          context.read<AuthBloc>().add(
                            VerifyCodeRequested(
                              email: widget._email!,
                              otp: pinValue,
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 32.h),

                      // did not receive the code ?
                      RichTextWidget(
                        mainText: "did not receive the code? ",
                        subText: "Resend",
                        onTap: () {
                          // call the function with user's email to send new code
                        },
                      ),

                      SizedBox(height: 32.h),

                      // Verify Button
                      MainElevatedButton(
                        textOnButton: "Verify",
                        onButtonTap: () {
                          if (otpFormKey.currentState!.validate()) {
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
          );
        },
      ),
    );
  }
}
