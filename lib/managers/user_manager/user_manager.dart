import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserManager {
  User? currentUser;

  Future<User?> signInWithEmail(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithApple();

  // Future<User?> signUpWithEmail(String name, String email, String password);

  Future<void> signOut();
}
