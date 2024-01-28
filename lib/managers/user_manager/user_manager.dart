import 'dart:async';

import 'package:breathe_with_me/managers/user_manager/auth_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserManager {
  Future<User?> signInWithEmail(String email, String password);

  Future<User?> signInWithGoogle();

  Future<User?> signInWithApple();

  Future<AuthResult> signUpWithEmail(
    String name,
    String email,
    String password,
  );

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<void> sendResetPassword(String email);

  Future<void> updateAccountSettings(String name, String email);
  
  Future<void> resetPassword(String code, String password);

  Stream<User?> get userStream;

  User? get currentUser;

  void dispose();
}
