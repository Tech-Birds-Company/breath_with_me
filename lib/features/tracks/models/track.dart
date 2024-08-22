import 'package:breathe_with_me/features/tracks/models/track_language.dart';
import 'package:breathe_with_me/features/tracks/models/tutor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const factory Track({
    required String id,
    required String trackFile,
    required String categoryKey,
    required int duration,
    required Tutor tutor,
    required String coverIcon,
    @JsonKey(unknownEnumValue: TrackLanguage.unknown)
    required TrackLanguage language,
    @Default(false) bool isPremium,
    int? listOrder,
    String? animationColor,
    String? artist,
    String? trackName,
    Map<String, String>? trackTitleTranslations,
  }) = _Track;

  const Track._();

  String? trackTranslatedTitle(String language) =>
      trackTitleTranslations?[language];

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
