import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
  final User? user;
  final String? errorMessage;

  AuthResult({
    this.user,
    this.errorMessage,
  });

  bool get isSuccess => user != null;
}
