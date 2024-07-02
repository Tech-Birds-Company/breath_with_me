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
      BlocSelector<TrackPlayerBloc, TrackPlayerState, bool>(
        bloc: bloc,
        selector: (state) => state.isPaused,
        builder: (context, isPaused) {
          final theme = Theme.of(context).extension<BWMTheme>()!;
          return SizedBox(
            width: 95,
            height: 95,
            child: FloatingActionButton(
              onPressed: bloc.onTogglePlay,
              elevation: 0,
              backgroundColor: const Color(0xFFC4C4C4).withOpacity(0.12),
              child: Center(
                child: SvgPicture.asset(
                  isPaused ? BWMAssets.playIcon : BWMAssets.pauseIcon,
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
