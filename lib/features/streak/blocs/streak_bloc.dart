import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StreakBloc extends BlocBase<StreakState> {
  final NavigationManager _navigationManager;

  StreakBloc(
    this._navigationManager,
  ) : super(
          const StreakState(
            selectedDay: 8,
            statistics: StreakStatisticsData(
              streaksCount: 1,
              practicesCount: 1,
              minutesCount: 30,
            ),
            quote: StreakQuoteData(
              quote: 'We cannot breathe in the past or the future. We inhale and exhale always in the present',
              author: 'Dasha Chen',
            ),
          ),
        );

  void onCloseScreen() => _navigationManager.pop();
}
