abstract class CartEvent {}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;
  final int quantity;

  AddToCartEvent({
    required this.productId,
    this.quantity = 1,
  });
}

class RemoveFromCartEvent extends CartEvent {
  final int itemId;
  RemoveFromCartEvent(this.itemId);
}

class IncreaseQuantityEvent extends CartEvent {
  final int itemId;
  IncreaseQuantityEvent(this.itemId);
}

class DecreaseQuantityEvent extends CartEvent {
  final int itemId;
  DecreaseQuantityEvent(this.itemId);
}