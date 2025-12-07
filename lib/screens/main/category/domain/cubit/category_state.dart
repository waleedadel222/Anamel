part of 'category_cubit_cubit.dart';

abstract class CategoryCubitState extends Equatable {
  const CategoryCubitState();

  @override
  List<Object> get props => [];
}

class CategoryCubitInitial extends CategoryCubitState {}

class CategoryCubitLoading extends CategoryCubitState {}

class CategoryCubitSuccess extends CategoryCubitState {
  final List<CategoryModel> categoryModel;
  const CategoryCubitSuccess({required this.categoryModel});

  @override
  List<Object> get props => [categoryModel];
}

class CategoryCubitFailure extends CategoryCubitState {
  final String error;
  const CategoryCubitFailure({required this.error});

  @override
  List<Object> get props => [error];
}
