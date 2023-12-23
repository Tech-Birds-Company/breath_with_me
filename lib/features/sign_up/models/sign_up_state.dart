import 'package:breathe_with_me/features/sign_up/models/sign_up_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';
part 'sign_up_state.g.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(SignUpError.none) SignUpError error,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String passwordConfirm,
    String? firebaseError,
  }) = _SignUpState;
  const SignUpState._();

  factory SignUpState.fromJson(Map<String, Object?> json) =>
      _$SignUpStateFromJson(json);

  String get errorMessage {
    return switch (error) {
      SignUpError.emptyName => 'Error: Name field is empty.',
      SignUpError.invalidEmail => 'Error: Email is invalid.',
      SignUpError.passwordMismatch => 'Error: Passwords do not match.',
      SignUpError.firebaseError => firebaseError ?? '',
      SignUpError.none => ''
    };
  }
}
