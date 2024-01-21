import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_statistics_state.freezed.dart';
part 'profile_statistics_state.g.dart';

@freezed
class ProfileStatisticsState with _$ProfileStatisticsState {
  const factory ProfileStatisticsState.empty() = _Empty;
  const factory ProfileStatisticsState.premiumOffer() = _PremiumOffer;
  const factory ProfileStatisticsState.streakStatistics(
    StreakStatisticsData streakStatistics,
  ) = _StreakStatistics;

  factory ProfileStatisticsState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatisticsStateFromJson(json);
}
