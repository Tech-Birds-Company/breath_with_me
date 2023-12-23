import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
  final String id;
  final String tutorNameKey;
  final String avatarUrl;

  Tutor({
    required this.id,
    required this.tutorNameKey,
    required this.avatarUrl,
  });

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}
