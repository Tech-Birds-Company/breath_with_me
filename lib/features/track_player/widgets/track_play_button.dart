import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackPlayButton extends ConsumerWidget {
  final TrackPlayerBloc _bloc;

  const TrackPlayButton(this._bloc, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      BlocSelector<TrackPlayerBloc, TrackPlayerState, bool>(
        bloc: _bloc,
        selector: (state) => state.isPaused,
        builder: (context, isPaused) => SizedBox(
          width: 95,
          height: 95,
          child: FloatingActionButton(
            onPressed: _bloc.onTogglePlay,
            elevation: 0,
            backgroundColor: const Color(0xFFC4C4C4)
                .withOpacity(0.12), // TODO(vasidmi): update theme
            child: Center(
              child: SvgPicture.asset(
                isPaused ? BWMAssets.playIcon : BWMAssets.pauseIcon,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      );
}
