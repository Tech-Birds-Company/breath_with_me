import 'package:freezed_annotation/freezed_annotation.dart';

enum ContentLanguage {
  @JsonValue('ru')
  ru,
  @JsonValue('en')
  en,
  unknown,
}
