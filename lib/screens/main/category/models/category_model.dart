class CategoryModel {
  final int id;
  final String title;
  final String imageUrl;
  final String description;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
