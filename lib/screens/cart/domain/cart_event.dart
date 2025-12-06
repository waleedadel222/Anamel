import '../model/cart_item_model.dart';

abstract class CartEvent {}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartItemModel item;
  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final int id;
  RemoveFromCartEvent(this.id);
}

class IncreaseQuantityEvent extends CartEvent {
  final int id;
  IncreaseQuantityEvent(this.id);
}

class DecreaseQuantityEvent extends CartEvent {
  final int id;
  DecreaseQuantityEvent(this.id);
}
