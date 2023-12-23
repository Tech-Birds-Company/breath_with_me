import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  final NavigationManager _navigationManager;

  StreakBloc(
    this._navigationManager,
  ) : super(const StreakState.loading());

  Future<void> init() async {}

  void onCloseScreen() => _navigationManager.pop();

  void loadUserRecord() {}
}
