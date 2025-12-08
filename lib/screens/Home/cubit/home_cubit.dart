import 'package:anamel/core/Apis/api_constans.dart';
import 'package:anamel/screens/main/category/domain/cubit/category_cubit_cubit.dart';
import 'package:anamel/screens/main/category/models/category_model.dart';
import 'package:anamel/screens/main/product/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final Dio dio = Dio();

  Future<void> fetchCategories() async {
    emit(HomeLoading());
    try {
      final response = await dio.get(
        ApiConstans.getProducts,
        options: Options(
          headers: {"Authorization": "Bearer ${ApiConstans.token}"},
        ),
      );
      print("Response: ${response.data}");
      final List<ProductModel> productList = (response.data as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();

      emit(HomeSuccess(productList: productList));
    } catch (error) {
      emit(HomeFailure(error: error.toString()));
      print("Error: $error");
      rethrow;
    }
  }
}
