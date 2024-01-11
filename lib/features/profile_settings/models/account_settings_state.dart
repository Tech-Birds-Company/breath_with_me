import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_settings_state.freezed.dart';
part 'account_settings_state.g.dart';

@freezed
class AccountSettingsState with _$AccountSettingsState {
  const factory AccountSettingsState({
    required String name,
    required String email,
  }) = _AccountSettingsState;

  factory AccountSettingsState.fromJson(Map<String, Object?> json) =>
      _$AccountSettingsStateFromJson(json);
}
