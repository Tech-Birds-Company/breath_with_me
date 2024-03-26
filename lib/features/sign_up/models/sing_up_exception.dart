import 'package:breathe_with_me/features/sign_up/models/sign_up_error.dart';

class SignUpException implements Exception {
  final SignUpError error;

  const SignUpException(this.error);
}
