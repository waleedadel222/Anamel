import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// Login Event
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

// Register Event
class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String passwordConfirmation;
  final String firstName;
  final String lastName;

  const RegisterRequested({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [email, password, passwordConfirmation,firstName,lastName];
}

// Logout Event
class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

// Check Auth Status
class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

// Send Reset Code Event
class SendResetCodeRequested extends AuthEvent {
  final String email;

  const SendResetCodeRequested({required this.email});

  @override
  List<Object?> get props => [email];
}

// Verify Reset Code Event
class VerifyCodeRequested extends AuthEvent {
  final String email;
  final String otp;

  const VerifyCodeRequested({
    required this.email,
    required this.otp,
  });

  @override
  List<Object?> get props => [email, otp];
}

// Reset Password Event
class ResetPasswordRequested extends AuthEvent {
  final String email;
  final String otp;
  final String newPassword;
  final String confirmPassword;


  const ResetPasswordRequested({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [email, otp, newPassword, confirmPassword];
}

// Resend Reset Code Event
class ResendCodeRequested extends AuthEvent {
  final String email;

  const ResendCodeRequested({required this.email});

  @override
  List<Object?> get props => [email];
}

