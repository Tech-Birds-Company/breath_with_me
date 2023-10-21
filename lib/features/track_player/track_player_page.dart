import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/widgets/play_button.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackPlayerPage extends HookConsumerWidget {
  final String trackId;

  const TrackPlayerPage({
    required this.trackId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.bloc.trackPlayer(trackId));

    useEffect(
      () {
        bloc.init();
        return bloc.dispose;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryBackground,
      ),
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: TrackPlayButton(trackId: trackId),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BlocSelector<TrackPlayerCubit, TrackPlayerState, double?>(
                bloc: bloc,
                selector: (state) => state.progress,
                builder: (context, progress) {
                  return LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.secondaryColor,
                    value: progress,
                    backgroundColor: theme.secondaryBackground,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
