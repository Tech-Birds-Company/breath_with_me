import 'package:freezed_annotation/freezed_annotation.dart';

enum TrackLanguage {
  @JsonValue('ru')
  ru,
  @JsonValue('en')
  en,
  unknown,
}
