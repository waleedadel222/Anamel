import 'package:dio/dio.dart';
import '../../../../core/Apis/api_constans.dart';
import '../../model/cart_model.dart';

class CartRepository {
  final Dio dio;

  CartRepository(this.dio);

  static const String baseUrl = "https://anamel.runasp.net/api";
  static const String getCartUrl = "$baseUrl/Cart";
  static const String addCartUrl = "$baseUrl/Cart/items";
  static const String updateCartItemUrl = "$baseUrl/Cart/items"; // PUT /items/{productId}
  static const String deleteCartUrl = "$baseUrl/Cart";
  static const String deleteItemUrl = "$baseUrl/Cart/items";

  Map<String, String> get headers => {
    "Authorization": "Bearer ${ApiConstans.token}",
    "Content-Type": "application/json",
  };

  ///  get cart
  Future<CartModel> getCart() async {
    final response = await dio.get(getCartUrl, options: Options(headers: headers));
    return CartModel.fromJson(response.data);
  }

  /// add item
  Future<CartModel> addItem({required int productId, required int quantity}) async {
    final response = await dio.post(
      addCartUrl,
      data: {
        "productId": productId,
        "quantity": quantity,
      },
      options: Options(headers: headers),
    );
    return CartModel.fromJson(response.data);
  }

  /// updated item quantity
  Future<CartModel> updateItemQuantity({required int productId, required int newQuantity}) async {
    final response = await dio.put(
      "$updateCartItemUrl/$productId",
      data: newQuantity,
      options: Options(headers: headers),
    );
    return CartModel.fromJson(response.data);
  }


/// delete item
  Future<CartModel> deleteItem(int productId) async {
    final response = await dio.delete(
      "$deleteItemUrl/$productId",
      options: Options(
        headers: headers,
        validateStatus: (status) => status! < 500,
      ),
    );

    if (response.statusCode == 204) {
      return getCart();
    }

    return CartModel.fromJson(response.data);
  }

  /// delete cart
  Future<void> deleteCart() async {
    await dio.delete(deleteCartUrl, options: Options(headers: headers),);
  }
}
