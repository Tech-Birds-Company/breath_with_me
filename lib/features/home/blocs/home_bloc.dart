import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeBloc extends BlocBase<Object?> {
  final PermissionsManager _permissionsManager;
  final SharedPreferencesManager _sharedPreferencesManager;
  final NavigationManager _navigationManager;

  HomeBloc(
    this._permissionsManager,
    this._sharedPreferencesManager,
    this._navigationManager,
  ) : super(null);

  Future<void> init() async {
    await _handleAppTracking();
    await _showSafetyPrecautions();
  }

  Future<void> _handleAppTracking() async {
    await _permissionsManager.handleAppTracking();
  }

  Future<void> _showSafetyPrecautions() async {
    final safetyPrecautionsShowed =
        _sharedPreferencesManager.getSafetyPrecautionsShowed;
    if (!safetyPrecautionsShowed) {
      _navigationManager.openSafetyPrecautions();
    }
  }
}