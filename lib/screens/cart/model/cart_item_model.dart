class CartItemModel {
  final int id;
  final String name;
  final String imagePath;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}
