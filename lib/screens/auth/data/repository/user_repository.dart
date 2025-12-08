// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../model/user_model.dart';
//
// class UserRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> createUserDocument(UserModel user) async {
//     try {
//       await _firestore.collection("users").doc(user.uid).set(user.toMap());
//     } catch (e) {
//       throw Exception((e.toString()));
//     }
//   }
//
//   Future<UserModel?> getUser(String uid) async {
//     try {
//       final userDoc = await _firestore.collection("users").doc(uid).get();
//       if (userDoc.exists && userDoc.data() != null) {
//         return UserModel.fromMap(userDoc.data()!);
//       }
//       return null;
//     } catch (e) {
//       throw Exception((e.toString()));
//     }
//   }
//
//   Future<void> deleteUserDocument(String uid) async {
//     try {
//       await _firestore.collection("users").doc(uid).delete();
//     } catch (e) {
//       throw Exception((e.toString()));
//     }
//   }
// }
