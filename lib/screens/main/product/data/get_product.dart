import 'package:anamel/core/Apis/api_constans.dart';
import 'package:dio/dio.dart';

class GetProduct {
  final Dio dio = Dio();
  Future<Response> fetchProduct() async {
    try {
      final response = await dio.get(
        ApiConstans.getProducts,
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

  Future<Response> getproductByCategory({required String id}) async {
    try {
      final response = await dio.get(
        "${ApiConstans.getPrductsByCategoryId}/$id",
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
