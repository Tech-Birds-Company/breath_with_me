import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_item.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/shimmer_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TracksList extends HookConsumerWidget {
  const TracksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.shared.bloc.tracksList);

    useEffect(
      () {
        bloc.init();
        return bloc.dispose;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BlocBuilder<TracksListBloc, TracksListState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when(
          data: (tracks) {
            return SliverList.separated(
              itemCount: tracks.length,
              separatorBuilder: (context, index) {
                if (index == tracks.length - 1) {
                  return null;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    color: theme.secondaryBackground,
                    thickness: 1,
                    height: 0,
                  ),
                );
              },
              itemBuilder: (context, index) {
                final track = tracks[index];
                final trackBloc = ref.read(
                  Di.shared.bloc.track(track),
                );
                return TrackItem(
                  key: ValueKey(track.id),
                  track: track,
                  onTap: trackBloc.openTrackPlayer,
                );
              },
            );
          },
          loading: () {
            return const ShimmerList();
          },
          error: () {
            return const SizedBox.shrink().toSliver;
          },
        );
      },
    );
  }
}
