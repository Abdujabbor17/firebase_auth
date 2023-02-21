import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/service/log_service.dart';
import 'package:firebase_test/service/utils_service.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }
  // static String currentUserId() {
  //   final User? firebaseUser = _auth.currentUser;
  //   return firebaseUser!.uid;
  // }
  static Future<User?> signInUser(
      BuildContext context,
      String email,
      String password
      ) async {

    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final User firebaseUser = _auth.currentUser!;
      return firebaseUser;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.snackBarError('No user found for that email.', context);
      } else if (e.code == 'wrong-password') {
        Utils.snackBarError('Wrong password provided for that user.', context);
      }
    }
    return null;
  }

  static Future<User?> signUpUser(
      BuildContext context,
      String fullname,
      String email,
      String password) async {
    try{
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      Utils.snackBarSuccess("you registered successfully",context);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.snackBarError('The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        Utils.snackBarError('The account already exists for that email.', context);
      } else {
        Utils.snackBarError("Try again later", context);
      }
    } /*catch (e) {
        LogService.e(e.toString());
    }*/
    return null;
  }

  static void signOutUser(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, '/SignIn');
  }
}
