import 'dart:async';

import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  final StreakProgressManager _streakProgressManager;
  final SubscriptionsManager _subscriptionsManager;
  final NavigationManager _navigationManager;

  StreakBloc(
    this._streakProgressManager,
    this._subscriptionsManager,
    this._navigationManager,
  ) : super(const StreakState());

  bool get isPremiumEnabled => _subscriptionsManager.premiumEnabled;

  StreamSubscription<StreakProgressV2>? _streakProgressSubscription;

  Future<void> init() async {
    final progress = await _streakProgressManager.getUserStreakProgress();
    emit(
      state.copyWith(progress: progress),
    );
    _setupStreakProgressSubscription();
  }

  void _setupStreakProgressSubscription() {
    _streakProgressSubscription ??= _streakProgressManager.stream.listen(
      (streakProgress) {
        emit(
          state.copyWith(
            progress: streakProgress,
          ),
        );
      },
    );
  }

  void onCloseTap() => _navigationManager.popToRoot();

  Future<void> onRestoreTap() async {
    final progress = await _streakProgressManager.restoreUserStreakProgress();
    emit(
      state.copyWith(progress: progress),
    );
  }

  void onSkipTap() {
    emit(
      state.copyWith(ignoreMissingDays: true),
    );
  }

  void dispose() {
    _streakProgressSubscription?.cancel();
    _streakProgressSubscription = null;
  }
}
