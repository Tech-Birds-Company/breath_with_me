import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_state.freezed.dart';
part 'delete_account_state.g.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState({
    @Default(false) bool isDeletionSucceed,
  }) = _DeleteAccountState;

  factory DeleteAccountState.fromJson(Map<String, Object?> json) =>
      _$DeleteAccountStateFromJson(json);
}
