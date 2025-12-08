import 'dart:developer';

import 'package:anamel/core/Apis/api_constans.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiConstans.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  getData({
    required String endPionts,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio!.get(
        endPionts,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<Response?> postRequest({
    required String endPionts,
    Map<String, dynamic>? headers,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio!.post(
        endPionts,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  updateRequest({
    required String token,
    required String endPionts,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio!.put(endPionts, queryParameters: data);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  deleteRequest({
    required String token,
    required String endPionts,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio!.delete(endPionts, queryParameters: data);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
