import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/track_player/widgets/play_button.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_player_animation.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_progress_indicator.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

class TrackPlayerPage extends HookConsumerWidget {
  final String trackId;

  const TrackPlayerPage({
    required this.trackId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.trackPlayer(trackId));

    useEffect(
      () {
        bloc.init();
        return bloc.dispose;
      },
      const [],
    );

    return Scaffold(
      appBar: const BWMAppBar(),
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            TrackPlayerAnimation(
              isPlayingStream: bloc.stream
                  .map((event) => !event.isPaused)
                  .startWith(!bloc.state.isPaused),
            ),
            const Spacer(),
            Center(
              child: TrackPlayButton(trackId: trackId),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 16,
                start: 16,
                end: 16,
              ),
              child: TrackProgressIndicator(trackId: trackId),
            ),
          ],
        ),
      ),
    );
  }
}
