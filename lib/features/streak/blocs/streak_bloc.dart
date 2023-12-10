import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  StreakBloc() : super(StreakState.initialState);
}
