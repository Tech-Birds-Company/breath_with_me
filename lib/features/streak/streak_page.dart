import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_without_premium.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StreakPage extends HookWidget {
  final StreakBloc bloc;

  const StreakPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final languageCode = EasyLocalization.of(context)!.locale.languageCode;
    final theme = Theme.of(context).extension<BWMTheme>()!;

    useEffect(
      () {
        bloc.init(languageCode);
        return null;
      },
      const [],
    );

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<StreakBloc, StreakState>(
              bloc: bloc,
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(color: theme.green3),
                    );
                  },
                  withoutPremium: (streaksCount, quote) {
                    return StreakWithoutPro(
                      streaksCount: streaksCount,
                      quote: quote,
                    );
                  },
                  premiumStartedOrContinued: (selectedDay, statistics, quote) {
                    return const Text('proStartedOrContinued');
                  },
                  premiumMissed: () {
                    return const Text('proMissed');
                  },
                );
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
