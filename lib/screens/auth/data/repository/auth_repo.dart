import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/Apis/api_constans.dart';
import '../../model/auth_request.dart';
import '../../model/user_model.dart';

class AuthRepo {
  final Dio _dio;

  AuthRepo() : _dio = Dio();

  // Login {
  Future<Response> login(LoginRequest requestData) async {
    try {
      final response = await _dio.post(
        ApiConstans.login,
        data: requestData.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      log("Response: ${response.data}");
      // return UserModel.fromJson(response.data['data']);

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Login failed',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Register
  Future<UserModel> register(RegisterRequest requestData) async {
    try {
      final response = await _dio.post(
        ApiConstans.register,
        data: requestData.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Registration failed',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Logout
  Future<void> logout(String token) async {
    try {
      await _dio.post(
        ApiConstans.logout,
        options: Options(
          headers: {"Authorization": "Bearer ${ApiConstans.token}"},
        ),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get User Profile
  Future<UserModel> getUserProfile(String userId) async {
    try {
      final response = await _dio.get(
        ApiConstans.getUserbyId,
        queryParameters: {'userId': userId},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to get user profile',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // // Refresh Token
  // Future<bool> _refreshToken() async {
  //   try {
  //     final refreshToken = await _storageService.getRefreshToken();
  //     if (refreshToken == null) return false;
  //
  //     final response = await _dio.post(
  //       '/refresh-token',
  //       data: {'refresh_token': refreshToken},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final newToken = response.data['token'];
  //       final newRefreshToken = response.data['refresh_token'];
  //
  //       await _storageService.saveToken(newToken);
  //
  //       if (newRefreshToken != null) {
  //         await _storageService.saveRefreshToken(newRefreshToken);
  //       }
  //
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Exception handler

  String _handleError(DioException error) {
    String errorMessage = '';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Server Timeout connection, Try again later';
        break;
      case DioExceptionType.badResponse:
        if (error.response?.data != null) {
          if (error.response!.data is Map) {
            errorMessage =
                error.response!.data['message'] ??
                error.response!.data['error'] ??
                'Unknown server error';
          } else {
            errorMessage = 'Server returned an unexpected response';
          }
        } else {
          errorMessage = 'Connection to server failed';
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Your request was cancelled';
        break;
      case DioExceptionType.unknown:
        if (error.error.toString().contains('SocketException')) {
          errorMessage = 'no Internet connection, Please check your connection';
        } else {
          errorMessage = 'Unexpected error occurred';
        }
        break;
      default:
        errorMessage = 'Unexpected error occurred';
    }

    return errorMessage;
  }

  // Verify Reset Code
  Future<bool> verifyEmailCode(String email, String otpCode) async {
    try {
      final response = await _dio.post(
        ApiConstans.verifyEmail,
        data: {"email": email, "otp": otpCode},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Invalid code',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Send Reset Code
  Future<String> sendResetCode(String email) async {
    try {
      final response = await _dio.post(
        ApiConstans.resendVerifyCode,
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return response.data['message'] ??
            'Reset code sent to your email successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to send reset code',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Reset Password
  Future<String> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstans.resetPassword,
        data: {
          'email': email,
          'otp': otp,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        return response.data['message'] ?? 'Password reset successful';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to reset password',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Resend Reset Code
  Future<String> resendResetCode(String email) async {
    try {
      final response = await _dio.post(
        ApiConstans.resendVerifyCode,
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return response.data['message'] ??
            'Reset code sent to your email successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to send reset code',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}
