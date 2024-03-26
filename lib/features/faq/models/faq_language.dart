import 'package:freezed_annotation/freezed_annotation.dart';

enum FaqLanguage {
  @JsonValue('ru')
  ru,
  @JsonValue('en')
  en,
  unknown,
}

class FaqLanguageHelper {
  static FaqLanguage fromCode(String code) {
    switch (code) {
      case 'ru':
        return FaqLanguage.ru;
      case 'en':
        return FaqLanguage.en;
      default:
        return FaqLanguage.unknown;
    }
  }
}
