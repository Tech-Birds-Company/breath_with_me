import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SafetyPrecautionsBloc extends BlocBase<Object?> {
  final NavigationManager _navigationManager;
  final SharedPreferencesManager _sharedPreferencesManager;

  SafetyPrecautionsBloc(
    this._navigationManager,
    this._sharedPreferencesManager,
  ) : super(null);

  void onCloseScreen() => _navigationManager.pop();

  void openFaq() => _navigationManager
    ..pop()
    ..openFaq();

  Future<void> setSafetyPrecautionsShowed() async {
    await _sharedPreferencesManager.setSafetyPrecautionsShowed();
  }
}
