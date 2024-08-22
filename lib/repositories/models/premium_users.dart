import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'premium_users.freezed.dart';
part 'premium_users.g.dart';

@freezed
class PremiumUsers with _$PremiumUsers {
  const factory PremiumUsers({
    @JsonKey(name: 'user_id') required String userId,
    @Default(false) bool enabled,
    @JsonKey(name: 'expire', fromJson: _parseDateTime) DateTime? expire,
  }) = _PremiumUsers;

  factory PremiumUsers.fromJson(Map<String, dynamic> json) =>
      _$PremiumUsersFromJson(json);
}

DateTime? _parseDateTime(Timestamp? timeStamp) {
  if (timeStamp == null) {
    return null;
  }
  return timeStamp.toDate();
}
