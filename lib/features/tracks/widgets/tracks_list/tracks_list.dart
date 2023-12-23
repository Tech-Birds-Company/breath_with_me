import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_item.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/shimmer_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TracksList extends HookWidget {
  final TracksListBloc bloc;

  const TracksList({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                return DependencyProvider(
                  provider: Di.shared.bloc.track(track),
                  builder: (context, dependency) => TrackItem(
                    key: ValueKey(track.id),
                    track: track,
                    onTap: dependency.openTrackPlayer,
                    trackIsDownloadedStream: dependency.trackIsDownloadedStream,
                    trackIsLikedStream: dependency.trackLikedStream,
                    onTrackLiked: dependency.onTrackLiked,
                  ),
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
