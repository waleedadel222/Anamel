class CartModel {
  CartModel({
      this.id, 
      this.userId, 
      this.items, 
      this.totalAmount, 
      this.totalItems,});

  CartModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    totalItems = json['totalItems'];
  }
  num? id;
  String? userId;
  List<Items>? items;
  num? totalAmount;
  num? totalItems;
CartModel copyWith({  num? id,
  String? userId,
  List<Items>? items,
  num? totalAmount,
  num? totalItems,
}) => CartModel(  id: id ?? this.id,
  userId: userId ?? this.userId,
  items: items ?? this.items,
  totalAmount: totalAmount ?? this.totalAmount,
  totalItems: totalItems ?? this.totalItems,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['totalAmount'] = totalAmount;
    map['totalItems'] = totalItems;
    return map;
  }

}

class Items {
  Items({
      this.id, 
      this.productId, 
      this.productName, 
      this.unitPrice, 
      this.quantity, 
      this.totalPrice, 
      this.imageUrl,});

  Items.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    productName = json['productName'];
    unitPrice = json['unitPrice'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    imageUrl = json['imageUrl'];
  }
  num? id;
  num? productId;
  String? productName;
  num? unitPrice;
  num? quantity;
  num? totalPrice;
  String? imageUrl;
Items copyWith({  num? id,
  num? productId,
  String? productName,
  num? unitPrice,
  num? quantity,
  num? totalPrice,
  String? imageUrl,
}) => Items(  id: id ?? this.id,
  productId: productId ?? this.productId,
  productName: productName ?? this.productName,
  unitPrice: unitPrice ?? this.unitPrice,
  quantity: quantity ?? this.quantity,
  totalPrice: totalPrice ?? this.totalPrice,
  imageUrl: imageUrl ?? this.imageUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['productName'] = productName;
    map['unitPrice'] = unitPrice;
    map['quantity'] = quantity;
    map['totalPrice'] = totalPrice;
    map['imageUrl'] = imageUrl;
    return map;
  }

}