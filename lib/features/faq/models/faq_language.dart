import 'package:freezed_annotation/freezed_annotation.dart';

enum FaqLanguage {
  @JsonValue('ru')
  ru,
  @JsonValue('en')
  en,
  unknown,
}
