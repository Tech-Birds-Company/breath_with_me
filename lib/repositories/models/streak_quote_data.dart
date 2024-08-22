import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_quote_data.freezed.dart';
part 'streak_quote_data.g.dart';

@freezed
class StreakQuoteData with _$StreakQuoteData {
  const factory StreakQuoteData({
    required String language,
    required String quote,
    required String author,
  }) = _StreakQuoteData;

  factory StreakQuoteData.fromJson(Map<String, dynamic> json) =>
      _$StreakQuoteDataFromJson(json);
}
