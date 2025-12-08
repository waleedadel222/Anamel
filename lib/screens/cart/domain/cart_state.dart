import '../model/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Items> cartItems;
  final double totalAmount;
  final int totalItems;

  CartLoaded({
    required this.cartItems,
    required this.totalAmount,
    required this.totalItems,
  });
}

class CartEmpty extends CartState {}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}