import 'dart:async';

import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/premium_manager/premium_manager.dart';
import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class StreakBloc extends CacheableBloc<StreakState> {
  final StreakProgressManager _streakProgressManager;
  final PremiumManager _premiumManager;
  final RemoteConfigRepository _remoteConfigRepository;
  final NavigationManager _navigationManager;

  StreakBloc(
    this._streakProgressManager,
    this._premiumManager,
    this._remoteConfigRepository,
    this._navigationManager,
  ) : super(const StreakState());

  @override
  String get key => DatabaseCachedKeys.cachedStreakStateKey;

  @override
  StreakState fromJson(Map<String, dynamic> json) => StreakState.fromJson(json);

  @override
  Map<String, dynamic> toJson(StreakState state) =>
      state.copyWith(ignoreMissingDays: false).toJson();

  Stream<bool> get isPremiumUserStream => _premiumManager.isPremiumUserStream;

  bool get isUserPremium => _premiumManager.isUserPremium;

  bool get premiumContentEnabled => _premiumManager.premiumContentEnabled;

  int get maxLivesCount => _remoteConfigRepository.streaks.monthLivesCount;

  StreamSubscription<StreakProgressV2>? _streakProgressSubscription;

  Future<void> init() async {
    final progress = await _streakProgressManager.getUserStreakProgress();
    emit(
      state.copyWith(progress: progress),
    );
    await cache();
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

  void onSkipTap() => emit(
        state.copyWith(ignoreMissingDays: true),
      );

  void dispose() {
    _streakProgressSubscription?.cancel();
    _streakProgressSubscription = null;
    cache();
  }
}
