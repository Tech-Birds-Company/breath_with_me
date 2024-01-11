import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_error.freezed.dart';
part 'sign_up_error.g.dart';

@freezed
class SignUpError with _$SignUpError {
  const factory SignUpError.emptyName() = EmptyName;
  const factory SignUpError.invalidEmail() = InvalidEmail;
  const factory SignUpError.passwordMismatch() = PasswordMismatch;
  const factory SignUpError.firebase(String message) = FirebaseError;

  factory SignUpError.fromJson(Map<String, Object?> json) =>
      _$SignUpErrorFromJson(json);
}
