import 'package:freezed_annotation/freezed_annotation.dart';

part 'streaks_progress.freezed.dart';
part 'streaks_progress.g.dart';

@freezed
class StreaksProgress with _$StreaksProgress {
  const factory StreaksProgress({
    required int livesCount,
    required DateTime livesExpireTimestamp,
    required int minutesCount,
    required int practicesCount,
    required List<DateTime> timeline,
  }) = _StreaksProgress;

  factory StreaksProgress.fromJson(Map<String, dynamic> json) =>
      _$StreaksProgressFromJson(json);
}
