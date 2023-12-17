import 'package:freezed_annotation/freezed_annotation.dart';

enum SignUpError {
  @JsonValue('emptyName')
  emptyName,
  @JsonValue('invalidEmail')
  invalidEmail,
  @JsonValue('passwordMismatch')
  passwordMismatch,
  none,
}
