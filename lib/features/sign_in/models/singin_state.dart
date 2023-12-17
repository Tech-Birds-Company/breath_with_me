import 'package:freezed_annotation/freezed_annotation.dart';

part 'singin_state.freezed.dart';
part 'singin_state.g.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
  }) = _SignInState;

  factory SignInState.fromJson(Map<String, Object?> json) =>
      _$SignInStateFromJson(json);
}
