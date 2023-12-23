import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserManager {
  Future<User?> signInWithEmail(String email, String password);

  Future<User?> signInWithGoogle();

  Future<User?> signInWithApple();

  Future<User?> signUpWithEmail(String name, String email, String password);

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<void> sendResetPassword(String email);

  Future<void> deleteAccount();

  Stream<User?> get userStream;

  User? get currentUser;
}
