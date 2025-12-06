class ProductModel {
  int id;
  String name;
  double price;
  String imageUrl;
  int stockQuantity;
  String description;
  String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.stockQuantity,
    required this.description,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      stockQuantity: json['stockQuantity'],
      description: json['description'],
      category: json['categoryName'],
    );
  }
}
