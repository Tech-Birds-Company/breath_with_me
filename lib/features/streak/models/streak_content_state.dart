import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_content_state.freezed.dart';
part 'streak_content_state.g.dart';

@freezed
class StreakContentState with _$StreakContentState {
  const factory StreakContentState.loading() = _Loading;
  const factory StreakContentState.withoutPremium(
    int streaksCount,
    StreakQuoteData quote,
  ) = _WithoutPremium;
  const factory StreakContentState.premiumStartedOrContinued(
    StreakStatisticsData statistics,
    int streaksCount,
    StreakLivesData livesData,
    StreakQuoteData quote,
  ) = _PremiumStartedOrContinued;
  const factory StreakContentState.premiumMissed(
    StreakStatisticsData statistics,
    StreakLivesData livesData,
  ) = _PremiumMissed;

  factory StreakContentState.fromJson(Map<String, dynamic> json) =>
      _$StreakContentStateFromJson(json);
}
