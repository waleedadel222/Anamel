part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class ProductSeccess extends ProductState {
  final List<ProductModel> products;

  const ProductSeccess({required this.products});
}

final class ProductFailure extends ProductState {
  final String message;
  const ProductFailure(this.message);
}

final class ProductLoading extends ProductState {}
