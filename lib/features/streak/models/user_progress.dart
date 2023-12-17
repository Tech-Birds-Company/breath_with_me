import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress.freezed.dart';
part 'user_progress.g.dart';

@freezed
class UserProgress with _$UserProgress {
  const factory UserProgress({
    required int streakDaysCompleted,
    required DateTime streakLastTimestamp,
    required List<DateTime> streakTimestamps,
  }) = _UserProgress;

  factory UserProgress.fromJson(Map<String, dynamic> json) => _$UserProgressFromJson(json);
}
