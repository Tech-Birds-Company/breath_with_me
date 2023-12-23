import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/models/streaks_progress.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  final Track _track;
  final bool isPremium = true;

  final RemoteConfigRepository _remoteConfigRepository;
  final StreaksProgressRepository _streaksProgressRepository;
  final StreaksQuotesRepository _streaksQuotesRepository;

  final UserManager _userManager;
  final NavigationManager _navigationManager;

  StreakBloc(
    this._track,
    this._remoteConfigRepository,
    this._streaksProgressRepository,
    this._streaksQuotesRepository,
    this._userManager,
    this._navigationManager,
  ) : super(const StreakState.loading());

  Future<void> init(String languageCode) async {
    final userID = _userManager.currentUser!.uid;
    final monthLivesCount = _remoteConfigRepository.streaks.monthLivesCount;
    final progress = await _streaksProgressRepository.addPractice(
      userID,
      DateTime.now(),
      _track.duration,
      monthLivesCount,
    );

    final StreakState state;
    if (isPremium) {
      final missedDaysCount = _getLastMissedDaysCount(progress);
      if (missedDaysCount == 1) {
        state = const StreakState.loading();
      } else {
        final streaksCount = _getLastStreaksCount(progress);
        state = StreakState.premiumStartedOrContinued(
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
          _streaksQuotesRepository.getQuote(languageCode),
        );
      }
    } else {
      state = StreakState.withoutPremium(
        _getLastStreaksCount(progress),
        _streaksQuotesRepository.getQuote(languageCode),
      );
    }
    emit(state);
  }

  void onCloseScreen() => _navigationManager.popToRoot();

  int _getLastStreaksCount(StreaksProgress progress) {
    final timeline = progress.timeline.sorted((a, b) => b.compareTo(a));

    var count = 1;
    var date = DateTime(timeline.first.year, timeline.first.month, timeline.first.day);
    for (var i = 1; i < timeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate = DateTime(timeline[i].year, timeline[i].month, timeline[i].day);
      if (currentDate == expectedDate) {
        count += 1;
        date = currentDate;
      } else {
        break;
      }
    }

    return count;
  }

  int _getLastMissedDaysCount(StreaksProgress progress) {
    final timeline = progress.timeline.sorted((a, b) => b.compareTo(a));

    var count = 0;
    var date = DateTime(timeline.first.year, timeline.first.month, timeline.first.day);
    for (var i = 1; i < timeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate = DateTime(timeline[i].year, timeline[i].month, timeline[i].day);
      if (currentDate != expectedDate) {
        count += 1;
        date = currentDate;
      } else {
        break;
      }
    }

    return count;
  }
}
