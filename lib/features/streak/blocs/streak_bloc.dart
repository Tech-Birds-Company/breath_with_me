import 'dart:async';

import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class StreakBloc extends CacheableBloc<StreakState> {
  final StreakProgressManager _streakProgressManager;
  final RemoteConfigRepository _remoteConfigRepository;
  final StreaksQuotesRepository _streaksQuotesRepository;
  final NavigationManager _navigationManager;

  StreakBloc(
    this._streakProgressManager,
    this._remoteConfigRepository,
    this._streaksQuotesRepository,
    this._navigationManager,
  ) : super(const StreakState());

  @override
  String get key => DatabaseCachedKeys.cachedStreakStateKey;

  @override
  StreakState fromJson(Map<String, dynamic> json) => StreakState.fromJson(json);

  @override
  Map<String, dynamic> toJson(StreakState state) => state.toJson();

  int get maxLivesCount => _remoteConfigRepository.streaks.monthLivesCount;

  StreamSubscription<StreakProgressV2>? _streakProgressSubscription;

  Future<void> init() async {
    final progress = await _streakProgressManager.getUserStreakProgress();
    emit(state.copyWith(progress: progress));
    _setupStreakProgressSubscription();
    await cache();
  }

  void _setupStreakProgressSubscription() =>
      _streakProgressSubscription ??= _streakProgressManager.stream.listen(
        (streakProgress) => emit(
          state.copyWith(progress: streakProgress),
        ),
      );

  Future<void> onRestoreTap() async {
    final progress = await _streakProgressManager.restoreUserStreakProgress();
    emit(
      state.copyWith(progress: progress),
    );
  }

  Future<StreakQuoteData?> getQuote(String language) async {
    final quote = await _streaksQuotesRepository.getQuote(language);
    return quote;
  }

  Future<void> onReminderTap() async {
    await _navigationManager.openReminderPage();
  }

  Future<void> onOpenPaywall() async {
    await _navigationManager.openPaywall();
  }

  void onCloseTap() => _navigationManager.popToRoot();

  void dispose() {
    _streakProgressSubscription?.cancel();
    _streakProgressSubscription = null;
  }
}
