import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';
part 'streak_state.g.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState.loading() = _Loading;
  const factory StreakState.withoutPremium(
    int streaksCount,
    StreakQuoteData quote,
  ) = WithoutPremium;
  const factory StreakState.premiumStartedOrContinued(
    StreakStatisticsData statistics,
    int streaksCount,
    StreakLivesData livesData,
    StreakQuoteData quote,
  ) = _PremiumStartedOrContinued;
  const factory StreakState.premiumMissed(
    StreakStatisticsData statistics,
    StreakLivesData livesData,
  ) = PremiumMissed;

  factory StreakState.fromJson(Map<String, dynamic> json) => _$StreakStateFromJson(json);
}
