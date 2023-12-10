import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_time_label.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackProgressIndicator extends ConsumerWidget {
  final TrackPlayerBloc _bloc;

  const TrackProgressIndicator(this._bloc, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  ColoredBox(
                    color: theme.secondaryBackground,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      height: 3,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: theme.secondaryColor,
                      child: BlocSelector<TrackPlayerBloc, TrackPlayerState,
                          double>(
                        bloc: _bloc,
                        selector: (state) => state.progress ?? 0,
                        builder: (context, progress) {
                          return SizedBox(
                            width: constraints.maxWidth * progress,
                            height: 3,
                          );
                        },
                      ),
                    ),
                  ),
                  ColoredBox(
                    color: theme.secondaryColor.withOpacity(0.2),
                    child:
                        BlocSelector<TrackPlayerBloc, TrackPlayerState, double>(
                      bloc: _bloc,
                      selector: (state) => state.downloadProgress,
                      builder: (context, downloadProgress) {
                        return SizedBox(
                          width: constraints.maxWidth * downloadProgress,
                          height: 3,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            BlocSelector<TrackPlayerBloc, TrackPlayerState, (int?, int?)>(
              bloc: _bloc,
              selector: (state) {
                return (state.currentTimeMs, state.estimatedTimeMs);
              },
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
      },
    );
  }
}
