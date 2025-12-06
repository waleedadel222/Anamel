import 'dart:developer';

import 'package:anamel/core/Apis/api_constans.dart';
import 'package:anamel/screens/main/product/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Dio dio = Dio();
  ProductCubit() : super(ProductInitial());

  Future<void> getproductByCategory({required String id}) async {
    emit(ProductLoading());
    try {
      final response = await dio.get(
        "${ApiConstans.getPrductsByCategoryId}/${id}",
        options: Options(
          headers: {"Authorization": "Bearer ${ApiConstans.token}"},
        ),
      );
      log("Response: ${response.data}");
      final List<ProductModel> products = (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      emit(ProductSeccess(products: products));
    } catch (error) {
      emit(ProductFailure(error.toString()));
    }
  }
}
