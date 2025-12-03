import 'package:anamel/core/Apis/api_constans.dart';
import 'package:anamel/screens/main/category/models/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubitCubit extends Cubit<CategoryCubitState> {
  CategoryCubitCubit() : super(CategoryCubitInitial());
  final Dio dio = Dio();

  Future<void> fetchCategories() async {
    emit(CategoryCubitLoading());
    try {
      final response = await dio.get(
        ApiConstans.getCategories,
        options: Options(
          headers: {"Authorization": "Bearer ${ApiConstans.token}"},
        ),
      );
      print("Response: ${response.data}");
      final List<CategoryModel> categoryModel = (response.data as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();

      emit(CategoryCubitSuccess(categoryModel: categoryModel));
    } catch (error) {
      emit(CategoryCubitFailure(error: error.toString()));
      print("Error: $error");
      rethrow;
    }
  }
}
