import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesManager {
  SharedPreferences? _instance;

  Future<void> init() async {
    _instance ??= await SharedPreferences.getInstance();
  }

  bool get getSafetyPrecautionsShowed =>
      _instance?.getBool(SharedPreferencesKeys.safetyPrecautions) ?? false;

  Future<void> setSafetyPrecautionsShowed() async {
    if (_instance != null) {
      await _instance!.setBool(SharedPreferencesKeys.safetyPrecautions, true);
    }
  }

  Future<void> clear() async {
    await _instance?.clear();
  }
}