// promo_model.dart
import 'dart:ui';

import 'package:anamel_home_screen/util/app_assets.dart';

class PromoPage {
  final String id;
  final String discountText;
  final String title;
  final String imagePath;
  final String description;
  final Color backgroundColor;
  final Color textColor;

  PromoPage({
    required this.id,
    required this.discountText,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.backgroundColor,
    required this.textColor,
  });
}

class PromoData {
  static List<PromoPage> promoPages = [
    PromoPage(
      id: '1',
      discountText: '25% off',
      title: 'Monsoon Arrival',
      imagePath: AppAssets.sofa,

      description: '25% Off Every Order + No Cost EMI!',
      backgroundColor: Color(0xff5A5D5F).withOpacity(0.4),
      textColor: Color.fromARGB(255, 66, 69, 37),
    ),
    PromoPage(
      id: '2',
      discountText: '30% off',
      title: 'Summer Sale',
      imagePath: AppAssets.sofa,
      description: '30% Off on All Products +Free Shipping!',
      backgroundColor: Color(0xff4A90E2).withOpacity(0.4),
      textColor: Color.fromARGB(255, 25, 67, 109),
    ),
    PromoPage(
      id: '3',
      discountText: '40% off',
      title: 'Winter Collection',
      imagePath: AppAssets.sofa,

      description: '40% Off Winter Items + Cashback!',
      backgroundColor: Color(0xff90EE90).withOpacity(0.4),
      textColor: Color.fromARGB(255, 34, 85, 36),
    ),
  ];
}
