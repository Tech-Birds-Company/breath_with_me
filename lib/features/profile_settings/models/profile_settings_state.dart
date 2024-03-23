import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings_state.freezed.dart';
part 'profile_settings_state.g.dart';

@freezed
class ProfileSettingsState with _$ProfileSettingsState {
  const factory ProfileSettingsState({
    required String name,
    required String email,
    @Default(false) bool isForgotPasswordButtonEnabled,
  }) = _ProfileSettingsState;

  factory ProfileSettingsState.fromJson(Map<String, Object?> json) =>
      _$ProfileSettingsStateFromJson(json);
}
