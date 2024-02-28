import 'package:breathe_with_me/features/safety_precautions/analytics/safety_precautions_event.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SafetyPrecautionsBloc extends BlocBase<Object?> {
  final NavigationManager _navigationManager;
  final SharedPreferencesManager _sharedPreferencesManager;

  SafetyPrecautionsBloc(
    this._navigationManager,
    this._sharedPreferencesManager,
  ) : super(null);

  void onCloseScreen() {
    BWMAnalytics.event(SafetyPrecautionsEvent.safetyPrecautionsClosed);
    _navigationManager.pop();
  }

  void openFaq() {
    BWMAnalytics.event(SafetyPrecautionsEvent.safetyPrecautionsOnOpenFaq);
    _navigationManager
      ..pop()
      ..openFaq();
  }

  Future<void> setSafetyPrecautionsShowed() async {
    BWMAnalytics.event(SafetyPrecautionsEvent.safetyPrecautionsOnSetShowed);
    await _sharedPreferencesManager.setSafetyPrecautionsShowed();
  }
}
