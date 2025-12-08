class UserModel {
  final String userId;
  final String email;
  final String firstName;
  final String lastName;
  final String? token;


  UserModel({
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'].toString(),
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'token': token,
    };
  }
}