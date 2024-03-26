import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_time_label.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackProgressIndicator extends StatefulWidget {
  final TrackPlayerBloc _bloc;

  const TrackProgressIndicator(this._bloc, {super.key});

  @override
  State<TrackProgressIndicator> createState() => _TrackProgressIndicatorState();
}

class _TrackProgressIndicatorState extends State<TrackProgressIndicator> {
  var _localPosition = 0.0;
  var _isInLocalState = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      children: [
        Stack(
          children: [
            BlocSelector<TrackPlayerBloc, TrackPlayerState, (double, double)>(
              bloc: widget._bloc,
              selector: (state) {
                return (
                  state.totalMs > 0.0
                      ? (state.currentTimeMs / state.totalMs).clamp(0.0, 1.0)
                      : 0.0,
                  state.downloadProgress,
                );
              },
              builder: (context, state) => SliderTheme(
                data: const SliderThemeData(
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                  trackHeight: 3,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 7,
                    disabledThumbRadius: 8,
                    elevation: 0,
                    pressedElevation: 0,
                  ),
                ),
                child: Slider(
                  value: _isInLocalState ? _localPosition : state.$1,
                  activeColor: theme.secondaryColor,
                  inactiveColor: theme.secondaryBackground,
                  secondaryActiveColor: theme.secondaryColor.withOpacity(0.2),
                  secondaryTrackValue: state.$2,
                  onChangeStart: (value) => setState(() {
                    _isInLocalState = true;
                    _localPosition = value;
                  }),
                  onChangeEnd: (value) {
                    setState(() {
                      _isInLocalState = false;
                      _localPosition = value;
                    });
                    widget._bloc.onSeekTrack(value);
                  },
                  onChanged: (value) => setState(() => _localPosition = value),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        BlocSelector<TrackPlayerBloc, TrackPlayerState, (int, int)>(
          bloc: widget._bloc,
          selector: (state) => (state.currentTimeMs, state.totalMs),
          builder: (context, state) {
            final (current, total) = state;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TrackTimeLabel(
                  durationMs: _isInLocalState
                      ? (total * _localPosition).round()
                      : current,
                ),
                TrackTimeLabel(
                  durationMs: total - current,
                  estimated: true,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
