// lib/bloc/auth_bloc.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/auth_repo.dart';
import '../model/auth_request.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;

  AuthBloc({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(const AuthInitial()) {
    // Handle Login
    on<LoginRequested>(_onLoginRequested);

    // Handle Register
    on<RegisterRequested>(_onRegisterRequested);

    // Handle Logout
    on<LogoutRequested>(_onLogoutRequested);

    // Check Auth Status
    on<CheckAuthStatus>(_onCheckAuthStatus);

    // Handle Password Reset
    on<SendResetCodeRequested>(_onSendResetCodeRequested);
    on<VerifyCodeRequested>(_onVerifyResetCodeRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }

  // Login Handler
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final loginRequest = LoginRequest(
        email: event.email,
        password: event.password,
      );

      final Response user = await _authRepo.login(loginRequest);
      log(user.data.toString());

      // save token to SharedPreferences
      // await _saveToken(user.token);

      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      // emit(AuthAuthenticated(user: null));
    }
  }

  // Register Handler
  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final registerRequest = RegisterRequest(
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
        firstName: event.firstName,
        lastName: event.lastName,
      );

      final user = await _authRepo.register(registerRequest);

      // save token to SharedPreferences
      // await _saveToken(user.token);

      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  // Logout Handler
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      // Get current user token
      if (state is AuthAuthenticated) {
        final currentState = state as AuthAuthenticated;
        if (currentState.user.token != null) {
          await _authRepo.logout(currentState.user.token!);
        }
      }

      // clear SharedPreferences
      // await _clearToken();

      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
      // even when can't logout from server, logout locally
      emit(const AuthUnauthenticated());
    }
  }

  // Check Auth Status Handler
  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      // final token = await _getToken();
      // if (token != null) {
      //   final user = await _authApiService.getUserProfile(token);
      //   emit(AuthAuthenticated(user: user));
      // } else {
      //   emit(const AuthUnauthenticated());
      // }

      // no token logic for now
      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(const AuthUnauthenticated());
    }
  }

  // Send Reset Code Handler
  Future<void> _onSendResetCodeRequested(
    SendResetCodeRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final message = await _authRepo.sendResetCode(event.email);

      emit(ResetCodeSent(message: message, email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      //  Unauthenticated
      emit(const AuthUnauthenticated());
    }
  }

  // Verify Reset Code Handler
  Future<void> _onVerifyResetCodeRequested(
    VerifyCodeRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final isValid = await _authRepo.verifyEmailCode(event.email, event.otp);

      if (isValid) {
        emit(ResetCodeVerified(email: event.email, otp: event.otp));
      } else {
        emit(const AuthError(message: "Invalid verification code"));
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
      emit(const AuthUnauthenticated());
    }
  }

  // Reset Password Handler
  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final message = await _authRepo.resetPassword(
        email: event.email,
        otp: event.otp,
        newPassword: event.newPassword,
        confirmPassword: event.confirmPassword,
      );

      emit(PasswordResetSuccess(message: message));
    } catch (e) {
      emit(AuthError(message: e.toString()));
      emit(const AuthUnauthenticated());
    }
  }
}
