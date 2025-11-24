class AddressModel {
  final String governorate;
  final String city;
  final String street;
  final String building;
  final String apartment;
  final String landmark;
  final String zipCode;
  final bool isDefault;

  AddressModel({
    required this.governorate,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.landmark,
    required this.zipCode,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      governorate: json['governorate'],
      city: json['city'],
      street: json['street'],
      building: json['building'],
      apartment: json['apartment'],
      landmark: json['landmark'],
      zipCode: json['zipCode'],
      isDefault: json['isDefault'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'governorate': governorate,
      'city': city,
      'street': street,
      'building': building,
      'apartment': apartment,
      'landmark': landmark,
      'zipCode': zipCode,
      'isDefault': isDefault,
    };
  }
}
