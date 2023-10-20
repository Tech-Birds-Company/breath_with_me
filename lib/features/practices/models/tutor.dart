import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutor.freezed.dart';
part 'tutor.g.dart';

@freezed
class Tutor with _$Tutor {
  const factory Tutor({
    required String id,
    required String tutorNameKey,
    required String avatarUrl,
  }) = _Tutor;

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
}
