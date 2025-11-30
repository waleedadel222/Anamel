class AddressModel {
  final String? id;
  final String governorate;
  final String city;
  final String street;
  final String building;
  final String apartment;
  final String landmark;
  final String zipCode;
  final String phoneNumber;
  final String additionalNotes;
  bool isDefault;

  AddressModel({
    this.id,
    required this.governorate,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.landmark,
    required this.zipCode,
    required this.phoneNumber,
    required this.additionalNotes,
    this.isDefault = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'governorate': governorate,
      'city': city,
      'street': street,
      'building': building,
      'apartment': apartment,
      'landmark': landmark,
      'zipCode': zipCode,
      'phoneNumber': phoneNumber,
      'additionalNotes': additionalNotes,
      'isDefault': isDefault,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map, String id) {
    return AddressModel(
      id: id,
      governorate: map['governorate'] ?? '',
      city: map['city'] ?? '',
      street: map['street'] ?? '',
      building: map['building'] ?? '',
      apartment: map['apartment'] ?? '',
      landmark: map['landmark'] ?? '',
      zipCode: map['zipCode'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      additionalNotes: map['additionalNotes'] ?? '',
      isDefault: map['isDefault'] ?? false,
    );
  }

  AddressModel copyWith({
    String? id,
    String? governorate,
    String? city,
    String? street,
    String? building,
    String? apartment,
    String? landmark,
    String? zipCode,
    String? phoneNumber,
    String? additionalNotes,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      governorate: governorate ?? this.governorate,
      city: city ?? this.city,
      street: street ?? this.street,
      building: building ?? this.building,
      apartment: apartment ?? this.apartment,
      landmark: landmark ?? this.landmark,
      zipCode: zipCode ?? this.zipCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      additionalNotes: additionalNotes ?? this.additionalNotes,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}