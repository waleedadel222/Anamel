import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserDocument(UserModel user) async {
    await _firestore.collection("users").doc(user.uid).set(user.toMap());

  }

  Future<UserModel?> getUser(String uid) async {
    final data =
    await _firestore.collection("users").doc(uid).get();

    if (data.exists) {
      return UserModel.fromMap(data.data()!);
    }
    return null;
  }
}
