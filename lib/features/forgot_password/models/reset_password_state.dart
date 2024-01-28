import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';
part 'reset_password_state.g.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required String oodCode,
    @Default('') String password,
    @Default('') String confirmPassword,
  }) = _ResetPasswordState;
  const ResetPasswordState._();

  factory ResetPasswordState.fromJson(Map<String, Object?> json) =>
      _$ResetPasswordStateFromJson(json);
}
