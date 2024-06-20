import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> signIn(String email, String passwrod) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passwrod,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log("$e");
    }
  }
}
