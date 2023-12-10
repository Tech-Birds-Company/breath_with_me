import 'package:breathe_with_me/features/practices/models/tutor.dart';
import 'package:breathe_with_me/utils/content_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const factory Track({
    required String id,
    required String trackFile,
    required String title,
    required int duration,
    required Tutor tutor,
    required String coverIcon,
    @JsonKey(unknownEnumValue: ContentLanguage.unknown)
    required ContentLanguage language,
    String? animationColor,
    @Default(false) bool isPremium,
    @Default(false) bool isNew,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
