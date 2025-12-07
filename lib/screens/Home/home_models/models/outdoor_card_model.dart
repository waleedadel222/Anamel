import 'package:anamel/core/const/app_assets_path.dart';

class OutdoorCardModel {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final double rating;
  final String? tag;

  OutdoorCardModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.tag,
  });
}

class OutdoorCollectionData {
  static List<OutdoorCardModel> collection = [
    OutdoorCardModel(
      id: '1',
      title: "Modern Velvet Armchair",
      subtitle: "Customer Choice",
      price: "\$ 567.00",
      imagePath: AppAssetsPath.armchair,
      rating: 4.8,
      tag: "Best Seller",
    ),
    OutdoorCardModel(
      id: '2',
      title: "Wooden Dining Table",
      subtitle: "Popular Item",
      price: "\$ 429.00",
      imagePath: "assets/images/secstyle.jpg",
      rating: 4.6,
      tag: "New",
    ),
    OutdoorCardModel(
      id: '3',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: AppAssetsPath.armchair,
      rating: 4.9,
      tag: "Hot",
    ),
    OutdoorCardModel(
      id: '4',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/chair.png",
      rating: 4.9,
      tag: "Hot",
    ),
    OutdoorCardModel(
      id: '5',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/chair.png",
      rating: 4.9,
      tag: "Hot",
    ),
    OutdoorCardModel(
      id: '6',
      title: "Leather Sofa Set",
      subtitle: "Premium Choice",
      price: "\$ 599.00",
      imagePath: "assets/images/chair.png",
      rating: 4.9,
      tag: "Hot",
    ),
    OutdoorCardModel(
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
