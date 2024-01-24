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
  ) : super(const StreakState.loading());

  bool get premiumEnabled => _subscriptionsManager.premiumEnabled;

  Stream<StreakProgressV2> get streakProgressStream =>
      _streakProgressManager.stream;

  Future<void> init() async {
    await _streakProgressManager.init();
    final progress = await _streakProgressManager.getUserStreakProgress();
    emit(StreakState.data(progress));
  }

  void onCloseTap() => _navigationManager.popToRoot();

  Future<void> onRestoreTap() async {}

  void onSkipTap() {}
}
