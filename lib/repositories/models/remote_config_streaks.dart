import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_streaks.g.dart';

@JsonSerializable()
class RemoteConfigStreaks {
  final int monthLivesCount;

  const RemoteConfigStreaks({this.monthLivesCount = 3});

  factory RemoteConfigStreaks.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigStreaksFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConfigStreaksToJson(this);
}
