import 'package:equatable/equatable.dart';
import '../model/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial State
class AuthInitial extends AuthState {
  const AuthInitial();
}

// Loading State
class AuthLoading extends AuthState {
  const AuthLoading();
}

// Authenticated State
class AuthAuthenticated extends AuthState {
  final UserModel user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

// Unauthenticated State
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

// delete State
class AuthDeleteAccountSuccess extends AuthState {
  final String message;

  const AuthDeleteAccountSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

// Error State
class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}


// Reset Code Sent State
class ResetCodeSent extends AuthState {
  final String message;
  final String email;

  const ResetCodeSent({
    required this.message,
    required this.email,
  });

  @override
  List<Object?> get props => [message, email];
}

// Reset Code Verified State
class ResetCodeVerified extends AuthState {
  final String email;
  final String otp;

  const ResetCodeVerified({
    required this.email,
    required this.otp,
  });

  @override
  List<Object?> get props => [email, otp];
}

// Password Reset Success State
class PasswordResetSuccess extends AuthState {
  final String message;

  const PasswordResetSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}