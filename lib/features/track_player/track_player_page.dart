import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_player_animation.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_player_button.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_progress_indicator.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:breathe_with_me/utils/string_hex_to_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

class TrackPlayerPage extends HookWidget {
  final TrackPlayerBloc bloc;

  const TrackPlayerPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    useEffect(
      () {
        BWMAnalytics.logScreenView('TrackPlayerPage');
        return null;
      },
      const [],
    );

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: Stack(
        children: [
          TrackPlayerAnimation(
            isPlayingStream: bloc.stream
                .map((event) => !event.isPaused)
                .startWith(!bloc.state.isPaused),
            animationColor: bloc.track.animationColor.toColor,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocSelector<TrackPlayerBloc, TrackPlayerState, bool>(
                  bloc: bloc,
                  selector: (state) {
                    if (state.totalMs == 0) {
                      return false;
                    }
                    final progress =
                        (state.currentTimeMs / state.totalMs).clamp(0.0, 1.0);
                    return progress >= BWMConstants.trackPlayerFinishThreshold;
                  },
                  builder: (context, canBeFinished) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TrackPlayerButton(bloc),
                      if (canBeFinished)
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: SizedBox(
                            width: 131,
                            child: TextButton(
                              onPressed: bloc.onTrackFinish,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: theme.green3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              child: Text(
                                LocaleKeys.trackFinishButton.tr(),
                                style: theme.typography.bodyMTrue,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      TrackProgressIndicator(bloc),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 117,
            child: BWMAppBar(
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
