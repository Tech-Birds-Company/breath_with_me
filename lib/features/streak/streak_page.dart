import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreakPage extends ConsumerWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.streak);

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            StreamBuilder(
              stream: bloc.stream,
              initialData: const StreakState(
                selectedDay: 8,
                statistics: StreakStatisticsData(
                  streaksCount: 1,
                  practicesCount: 1,
                  minutesCount: 30,
                ),
                quote: StreakQuoteData(
                  quote:
                      'We cannot breathe in the past or the future. We inhale and exhale always in the present',
                  author: 'Dasha Chen',
                ),
              ), // TODO(bestk1ngarthur): Remove mock data
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return StreakList(state: snapshot.data!);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: bloc.onCloseScreen,
                icon: Icon(
                  Icons.close,
                  color: theme.primaryColor,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
