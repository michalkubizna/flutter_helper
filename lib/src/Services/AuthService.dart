import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  User getCurrentUser() {
    return _auth.currentUser;
  }

  String uid() {
    return FirebaseAuth.instance.currentUser?.uid ?? "_";
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<User> signIn(String email, String password) async {
    final User user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    return user;
  }

  Future<User> signUp(String email, String password) async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

//    if (!user.emailVerified) {
//      user.sendEmailVerification();
//    }

    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteUser(String password) async {
    final User user = _auth.currentUser;

    await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: user.email, password: password));

    await user.delete();
  }

  Future<void> updateEmail(String email, String password) async {
    final User user = _auth.currentUser;

    await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: user.email, password: password));

    await user.updateEmail(email);
  }

  Future<void> updatePassword(String newPassword, String password) async {
    final User user = _auth.currentUser;

    await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: user.email, password: password));

    await user.updatePassword(newPassword);
  }

  Stream<User> onAuthChanged() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
