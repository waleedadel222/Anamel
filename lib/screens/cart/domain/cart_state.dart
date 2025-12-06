
import '../model/cart_item_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> cartItems;
  final double totalPrice;

  CartLoaded(this.cartItems)
      : totalPrice = cartItems.fold(
      0, (sum, item) => sum + (item.price * item.quantity));
}

class CartEmpty extends CartState {}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
