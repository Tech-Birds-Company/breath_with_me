import 'package:breathe_with_me/features/streak/models/streak_content_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/models/streaks_progress.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  final Track _track;
  final Locale _locale;

  final RemoteConfigRepository _remoteConfigRepository;
  final StreaksProgressRepository _streaksProgressRepository;
  final StreaksQuotesRepository _streaksQuotesRepository;

  final UserManager _userManager;
  final NavigationManager _navigationManager;
  final SubscriptionsManager _subscriptionManager;

  StreakBloc(
    this._track,
    this._locale,
    this._remoteConfigRepository,
    this._streaksProgressRepository,
    this._streaksQuotesRepository,
    this._userManager,
    this._navigationManager,
    this._subscriptionManager,
  ) : super(const StreakState(null, StreakContentState.loading()));

  bool get _premiumEnabled => _subscriptionManager.premiumEnabled;

  Future<void> init() async {
    emit(const StreakState(null, StreakContentState.loading()));

    final progress = await _streaksProgressRepository.addPractice(
      _userManager.currentUser!.uid,
      DateTime.now(),
      _track.duration,
      _remoteConfigRepository.streaks.monthLivesCount,
    );
    final contentState = getContentState(progress);
    emit(StreakState(progress, contentState));
  }

  void onCloseTap() => _navigationManager.popToRoot();

  Future<void> onRestoreTap() async {
    final restoredDate = DateTime.now().subtract(const Duration(days: 1));
    final progress = await _streaksProgressRepository.restoreStreak(
      _userManager.currentUser!.uid,
      restoredDate,
      _remoteConfigRepository.streaks.monthLivesCount,
    );
    final contentState = getContentState(progress);
    emit(StreakState(progress, contentState));
  }

  void onSkipTap() {
    final progress = state.progress;
    if (progress != null) {
      final streaksCount = progress.streaksCount;
      final contentState = StreakContentState.premiumStartedOrContinued(
        StreakStatisticsData.full(
          progress.streaksCount,
          progress.practicesCount,
          progress.minutesCount,
        ),
        streaksCount,
        StreakLivesData(
          availableLivesCount: progress.livesCount,
          totalLivesCount: _remoteConfigRepository.streaks.monthLivesCount,
          showTitle: true,
          showFooter: progress.livesCount == 0,
        ),
        _streaksQuotesRepository.getQuote(_locale.languageCode),
      );
      emit(StreakState(progress, contentState));
    }
  }

  StreakContentState getContentState(StreaksProgress progress) {
    final StreakContentState state;
    if (_premiumEnabled) {
      final streaksCount = progress.streaksCount;
      final missedDaysCount = progress.missedDaysCount;
      if ((missedDaysCount == 1) && (progress.livesCount > 0)) {
        state = StreakContentState.premiumMissed(
          StreakStatisticsData.missed(streaksCount, missedDaysCount),
          StreakLivesData(
            availableLivesCount: progress.livesCount,
            totalLivesCount: _remoteConfigRepository.streaks.monthLivesCount,
          ),
        );
      } else {
        state = StreakContentState.premiumStartedOrContinued(
          StreakStatisticsData.full(
            streaksCount,
            progress.practicesCount,
            progress.minutesCount,
          ),
          streaksCount,
          StreakLivesData(
            availableLivesCount: progress.livesCount,
            totalLivesCount: _remoteConfigRepository.streaks.monthLivesCount,
            showTitle: true,
            showFooter: progress.livesCount == 0,
          ),
          _streaksQuotesRepository.getQuote(_locale.languageCode),
        );
      }
    } else {
      state = StreakContentState.withoutPremium(
        progress.streaksCount,
        _streaksQuotesRepository.getQuote(_locale.languageCode),
      );
    }
    return state;
  }
}
