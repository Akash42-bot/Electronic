import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  ///signup
  Future<User?> signUpWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      debugPrint("Some error happened");
    }
    return null;
  }

  ///signin

  Future<User?> signInWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      debugPrint("Some error happened");
    }
    return null;
  }

  ///logout
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}