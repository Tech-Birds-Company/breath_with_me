import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository.dart';
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
    final minutesCount = _track.duration ~/ 60;
    final monthLivesCount = _remoteConfigRepository.streaks.monthLivesCount;
    final progress = await _streaksProgressRepository.addPractice(
      userID,
      DateTime.now(),
      minutesCount,
      monthLivesCount,
    );

    final StreakState state;
    if (isPro) {
      state = const StreakState.loading();
    } else {
      state = const StreakState.withoutPro(
        2,
        StreakQuoteData(
          quote:
              'We cannot breathe in the past or the future. We inhale and exhale always in the present',
          author: 'Dasha Chen',
        ),
      );
    }
    emit(state);
  }

  void onCloseScreen() => _navigationManager.popToRoot();

  void loadUserRecord() {}
}
