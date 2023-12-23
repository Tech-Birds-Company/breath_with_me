import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_lives_data.freezed.dart';
part 'streak_lives_data.g.dart';

@freezed
class StreakLivesData with _$StreakLivesData {
  const factory StreakLivesData({
    required int availableLivesCount,
    required int totalLivesCount,
    required bool showTitle,
    required bool showFooter,
  }) = _StreakLivesData;

  factory StreakLivesData.fromJson(Map<String, dynamic> json) =>
      _$StreakLivesDataFromJson(json);
}
