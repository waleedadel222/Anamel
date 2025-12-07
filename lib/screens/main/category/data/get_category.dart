import 'package:anamel/core/Apis/api_constans.dart';
import 'package:dio/dio.dart';

class GetCategory {
  final Dio dio = Dio();

  Future<Response> fetchCategories() async {
    try {
      final response = await dio.get(
        ApiConstans.getCategories,
        options: Options(
          headers: {"Authorization": "Bearer ${ApiConstans.token}"},
        ),
      );
      return response;
    } catch (error) {
      print("Error: $error");
      rethrow;
    }
  }

  Future<Response> fetchCategoryBiId({required String id}) async {
    try {
      final response = await dio.get(
        "${ApiConstans.getCategories}/$id",
        options: Options(
          headers: {"Authorization": "Bearer ${ApiConstans.token}"},
        ),
      );
      return response;
    } catch (error) {
      print("Error: $error");
      rethrow;
    }
  }
}
