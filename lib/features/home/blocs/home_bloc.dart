import 'dart:async';

import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeBloc extends BlocBase<Object?> {
  final PermissionsManager _permissionsManager;
  final SharedPreferencesManager _sharedPreferencesManager;
  final UserManager _userManager;
  final NavigationManager _navigationManager;

  HomeBloc(
    this._permissionsManager,
    this._sharedPreferencesManager,
    this._userManager,
    this._navigationManager,
  ) : super(null);

  Future<void> init() async {
    await _permissionsManager.requestPushNotificationsPermissions();
    await _handleAppTracking();
    await _showSafetyPrecautions();
    await _showFirstTimePaywall();
  }

  Future<void> _handleAppTracking() => _permissionsManager.handleAppTracking();

  Future<void> _showSafetyPrecautions() async {
    final safetyPrecautionsShowed =
        _sharedPreferencesManager.getSafetyPrecautionsShowed;
    if (!safetyPrecautionsShowed) {
      await _navigationManager.openSafetyPrecautions();
    }
  }

  Future<void> _showFirstTimePaywall() async {
    final firstTimePaywallShown =
        _sharedPreferencesManager.firstTimePaywallShown;
    final isUserPremium = await _userManager.isUserPremium;
    if (!firstTimePaywallShown && !isUserPremium) {
      await _navigationManager.openPaywall();
      await _sharedPreferencesManager.setFirstTimePaywallShown();
    }
  }

  Future<void> onOpenPaywall() async {
    await _navigationManager.openPaywall();
  }
}
