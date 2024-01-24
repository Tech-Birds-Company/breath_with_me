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
  ) : super(const StreakState.loading(premiumEnabled: false)) {
    _init();
  }

  StreamSubscription<bool>? _premiumSubscription;
  StreamSubscription<StreakProgressV2>? _streakProgressSubscription;

  Future<void> _init() async {
    emit(state.copyWith(premiumEnabled: _subscriptionsManager.premiumEnabled));
    _premiumSubscription ??= _subscriptionsManager.premiumEnabledStream.listen(
      (premiumEnabled) {
        emit(state.copyWith(premiumEnabled: premiumEnabled));
      },
    );

    _streakProgressSubscription ??= _streakProgressManager.stream.listen(
      (streakProgress) => emit(
        StreakState.data(
          streakProgress,
          premiumEnabled: _subscriptionsManager.premiumEnabled,
        ),
      ),
    );
    final progress = await _streakProgressManager.getUserStreakProgress();
    emit(
      StreakState.data(
        progress,
        premiumEnabled: state.premiumEnabled,
      ),
    );
  }

  void onCloseTap() => _navigationManager.popToRoot();

  Future<void> onRestoreTap() async {}

  void onSkipTap() {}

  void dispose() {
    _premiumSubscription?.cancel();
    _streakProgressSubscription?.cancel();
    _premiumSubscription = null;
    _streakProgressSubscription = null;
  }
}
