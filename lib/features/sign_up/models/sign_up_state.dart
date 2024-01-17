import 'package:breathe_with_me/features/sign_up/models/sign_up_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';
part 'sign_up_state.g.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    SignUpError? error,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String passwordConfirm,
  }) = _SignUpState;

  factory SignUpState.fromJson(Map<String, dynamic> json) =>
      _$SignUpStateFromJson(json);
}
