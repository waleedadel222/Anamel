import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseRepository {
  Future<User?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      } else {
        throw (e.message.toString());
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      } else {
        throw (e.message.toString());
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Stream<User?> getUserState() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<void> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
