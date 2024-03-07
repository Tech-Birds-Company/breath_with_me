import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_time_label.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackProgressIndicator extends StatelessWidget {
  final TrackPlayerBloc _bloc;

  const TrackProgressIndicator(this._bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      children: [
        Stack(
          children: [
            BlocSelector<TrackPlayerBloc, TrackPlayerState, (double, double)>(
              bloc: _bloc,
              selector: (state) =>
                  (state.progress ?? 0, state.downloadProgress),
              builder: (context, state) => SliderTheme(
                data: const SliderThemeData(
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                  trackHeight: 3,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                    disabledThumbRadius: 8,
                    elevation: 0,
                    pressedElevation: 0,
                  ),
                ),
                child: Slider(
                  value: state.$1,
                  activeColor: theme.secondaryColor,
                  inactiveColor: theme.secondaryBackground,
                  secondaryActiveColor: theme.secondaryColor.withOpacity(0.2),
                  secondaryTrackValue: state.$2,
                  onChanged: _bloc.onSeekTrack,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        BlocSelector<TrackPlayerBloc, TrackPlayerState, (int?, int?)>(
          bloc: _bloc,
          selector: (state) => (state.currentTimeMs, state.estimatedTimeMs),
          builder: (context, state) {
            final (current, estimated) = state;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TrackTimeLabel(durationMs: current),
                TrackTimeLabel(durationMs: estimated, estimated: true),
              ],
            );
          },
        ),
      ],
    );
  }
}
