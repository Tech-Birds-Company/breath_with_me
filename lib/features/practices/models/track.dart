import 'package:breathe_with_me/features/practices/models/tutor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

enum TrackLanguage {
  @JsonValue('ru')
  ru,
  @JsonValue('ru')
  en,
  unknown,
}

@freezed
class Track with _$Track {
  const factory Track({
    required String id,
    required String trackFile,
    required String title,
    required int duration,
    required Tutor tutor,
    @JsonKey(unknownEnumValue: TrackLanguage.unknown)
    required TrackLanguage language,
    @Default(false) bool isPremium,
    @Default(false) bool isNew,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
