import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TrackPlayerButton extends StatelessWidget {
  final TrackPlayerBloc bloc;

  const TrackPlayerButton(this.bloc, {super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TrackPlayerBloc, TrackPlayerState>(
        bloc: bloc,
        buildWhen: (previous, current) {
          final pauseChanged = previous.isPaused != current.isPaused;
          final isInitializedChanged =
              previous.playerInitialized != current.playerInitialized;
          return pauseChanged || isInitializedChanged;
        },
        builder: (context, state) {
          if (!state.playerInitialized) {
            return const SizedBox.shrink();
          }
          final theme = Theme.of(context).extension<BWMTheme>()!;
          return SizedBox(
            width: 95,
            height: 95,
            child: FloatingActionButton(
              onPressed: bloc.onTogglePlay,
              elevation: 0,
              backgroundColor: const Color(0xFFC4C4C4)
                  .withOpacity(0.12), // TODO(vasidmi): update theme
              child: Center(
                child: SvgPicture.asset(
                  state.isPaused ? BWMAssets.playIcon : BWMAssets.pauseIcon,
                  colorFilter: ColorFilter.mode(
                    theme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          );
        },
      );
}
