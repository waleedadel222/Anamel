import 'package:anamel_home_screen/util/app_assets.dart';

class TopSallingCardModel {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final double rating;
  final String? tag;

  TopSallingCardModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.tag,
  });
}

class ProductData {
  static List<TopSallingCardModel> products = [
    TopSallingCardModel(
      id: '1',
      title: "Modern handMade",
      subtitle: "Customer Choice",
      price: "\$ 237.00",
      imagePath: AppAssets.handmade,
      rating: 4.8,
      tag: "Best Seller",
    ),
    TopSallingCardModel(
      id: '2',
      title: "macrame assortment indoors",
      subtitle: "Popular Item",
      price: "\$ 189.00",
      imagePath: AppAssets.macrame,
      rating: 4.6,
      tag: "New",
    ),
    TopSallingCardModel(
      id: '3',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/style.jpg",
      rating: 4.9,
      tag: "Hot",
    ),
    TopSallingCardModel(
      id: '4',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/chair.png",
      rating: 4.9,
      tag: "Hot",
    ),
    TopSallingCardModel(
      id: '5',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/chair.png",
      rating: 4.9,
      tag: "Hot",
    ),
    TopSallingCardModel(
      id: '6',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/chair.png",
      rating: 4.9,
      tag: "Hot",
    ),
    TopSallingCardModel(
      id: '7',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/secstyle.jpg",
      rating: 4.9,
      tag: "Hot",
    ),
  ];
}
