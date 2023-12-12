import 'package:freezed_annotation/freezed_annotation.dart';

enum ContentLanguage {
  @JsonValue('ru')
  ru,
  @JsonValue('en')
  en,
  unknown,
}

class ContentLanguageHelper {
  static ContentLanguage fromCode(String code) {
    switch (code) {
      case 'ru':
        return ContentLanguage.ru;
      case 'en':
        return ContentLanguage.en;
      default:
        return ContentLanguage.unknown;
    }
  }
}
