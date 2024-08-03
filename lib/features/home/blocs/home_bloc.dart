import 'dart:async';

import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeBloc extends BlocBase<Object?> {
  final StreakProgressManager _streakProgressManager;
  final PermissionsManager _permissionsManager;
  final SharedPreferencesManager _sharedPreferencesManager;
  final NavigationManager _navigationManager;

  HomeBloc(
    this._streakProgressManager,
    this._permissionsManager,
    this._sharedPreferencesManager,
    this._navigationManager,
  ) : super(null);

  Future<void> init() async {
    unawaited(_streakProgressManager.checkAndResetStreak());
    await _permissionsManager.requestPushNotificationsPermissions();
    await _handleAppTracking();
    await _showSafetyPrecautions();
  }

  Future<void> _handleAppTracking() => _permissionsManager.handleAppTracking();

  Future<void> _showSafetyPrecautions() async {
    final safetyPrecautionsShowed =
        _sharedPreferencesManager.getSafetyPrecautionsShowed;
    if (!safetyPrecautionsShowed) {
      await _navigationManager.openSafetyPrecautions();
    }
  }
}
