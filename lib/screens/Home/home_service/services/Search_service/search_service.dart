import 'package:anamel/screens/Home/home_models/models/outdoor_card_model.dart';
import 'package:anamel/screens/Home/home_models/models/top_salling_card_model.dart';

class SearchService {
  static List<dynamic> searchProducts(String query, List<dynamic> allProducts) {
    if (query.isEmpty) return [];

    final searchQuery = query.toLowerCase();

    return allProducts.where((product) {
      try {
        String title = '';
        String subtitle = '';
        String tag = '';

        if (product is TopSallingCardModel) {
          title = product.title.toLowerCase();
          subtitle = product.subtitle.toLowerCase();
          tag = product.tag?.toLowerCase() ?? '';
        } else if (product is OutdoorCardModel) {
          title = product.title.toLowerCase();
          subtitle = product.subtitle.toLowerCase();
          tag = product.tag?.toLowerCase() ?? '';
        }

        return title.contains(searchQuery) ||
            subtitle.contains(searchQuery) ||
            (tag.isNotEmpty && tag.contains(searchQuery));
      } catch (e) {
        return false;
      }
    }).toList();
  }

  static List<dynamic> getAllProducts() {
    return [...ProductData.products, ...OutdoorCollectionData.collection];
  }
}
