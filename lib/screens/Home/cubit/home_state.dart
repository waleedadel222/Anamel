part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductModel> productList;
  const HomeSuccess({required this.productList});

  @override
  List<Object> get props => [productList];
}

final class HomeFailure extends HomeState {
  final String error;
  const HomeFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class HomeLoading extends HomeState {}
