import '../../model/cart_item_model.dart';

class CartRepository {
  // temporary dummy cart items
  List<CartItemModel> cartItems =
  [
    CartItemModel(
      id: 1,
      name: "Necklace",
      imagePath: "assets/images/necklace.jpg",
      price: 120.0,
      quantity: 1,
    ),
    CartItemModel(
      id: 2,
      name: "Rings",
      imagePath:"assets/images/rings.jpg",
      price: 100,
      quantity: 1,
    ),
    CartItemModel(
      id: 3,
      name: "Bracelet",
      imagePath: "assets/images/bracelet.jpg",
      price: 160,
      quantity: 2,
    ),
    CartItemModel(
      id: 4,
      name: "Necklace",
      imagePath: "assets/images/necklace.jpg",
      price: 120.0,
      quantity: 1,
    ),
    CartItemModel(
      id: 5,
      name: "Rings",
      imagePath:"assets/images/rings.jpg",
      price: 100,
      quantity: 1,
    ),
    CartItemModel(
      id: 6,
      name: "Bracelet",
      imagePath: "assets/images/bracelet.jpg",
      price: 160,
      quantity: 2,
    ),  CartItemModel(
      id: 7,
      name: "Necklace",
      imagePath: "assets/images/necklace.jpg",
      price: 120.0,
      quantity: 1,
    ),
    CartItemModel(
      id: 8,
      name: "Rings",
      imagePath:"assets/images/rings.jpg",
      price: 100,

      quantity: 1,

    ),
    CartItemModel(
      id: 9,
      name: "Bracelet",
      imagePath: "assets/images/bracelet.jpg",
      price: 160,
      quantity: 2,
    ),
  ];


  List<CartItemModel> getCartItems() {
    return cartItems;
  }

  void addToCart(CartItemModel item) {
    final existingItem = cartItems.firstWhere(
          (e) => e.id == item.id,
      orElse: () => CartItemModel(id: -1, name: '', imagePath: '', price: 0),
    );

    if (existingItem.id != -1) {
      existingItem.quantity++;
    } else {
      cartItems.add(item);
    }
  }

  void removeFromCart(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  void increaseQuantity(int id) {
    cartItems.firstWhere((e) => e.id == id).quantity++;
  }

  void decreaseQuantity(int id) {
    final item = cartItems.firstWhere((e) => e.id == id);
    if (item.quantity > 1) {
      item.quantity--;
    }
  }
}
