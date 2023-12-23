import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/models/streaks_progress.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  final Track _track;
  final bool isPro = false;

  final RemoteConfigRepository _remoteConfigRepository;
  final StreaksProgressRepository _streaksProgressRepository;

  final UserManager _userManager;
  final NavigationManager _navigationManager;

  StreakBloc(
    this._track,
    this._remoteConfigRepository,
    this._streaksProgressRepository,
    this._userManager,
    this._navigationManager,
  ) : super(const StreakState.loading());

  Future<void> init() async {
    final userID = _userManager.currentUser!.uid;
    final monthLivesCount = _remoteConfigRepository.streaks.monthLivesCount;
    final progress = await _streaksProgressRepository.addPractice(
      userID,
      DateTime.now(),
      _track.duration,
      monthLivesCount,
    );

    final StreakState state;
    if (isPro) {
      state = const StreakState.loading();
    } else {
      state = StreakState.withoutPro(
        _getLastStreaksCount(progress),
        const StreakQuoteData(
          quote:
              'We cannot breathe in the past or the future. We inhale and exhale always in the present',
          author: 'Dasha Chen',
        ),
      );
    }
    emit(state);
  }

  void onCloseScreen() => _navigationManager.popToRoot();

  int _getLastStreaksCount(StreaksProgress progress) {
    final timeline = progress.timeline.sorted((a, b) => b.compareTo(a));

    var count = 1;
    var date =
        DateTime(timeline.first.year, timeline.first.month, timeline.first.day);
    for (var i = 1; i < timeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate =
          DateTime(timeline[i].year, timeline[i].month, timeline[i].day);
      if (currentDate == expectedDate) {
        count += 1;
        date = currentDate;
      } else {
        break;
      }
    }

    return count;
  }
}
