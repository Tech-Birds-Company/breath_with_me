import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/tracks/blocs/track_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_item.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/shimmer_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TracksList extends ConsumerWidget {
  const TracksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final tracksListBloc = ref.watch(Di.bloc.tracksList);

    return BlocBuilder<TracksListBloc, TracksListState>(
      bloc: tracksListBloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) => state.when(
        data: (stateTracks, filteredTracks) {
          final tracks = filteredTracks ?? stateTracks;
          final itemsCount = tracks.length;
          return SliverList.separated(
            itemCount: itemsCount,
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                color: theme.secondaryBackground,
                thickness: 1,
                height: 0,
              ),
            ),
            itemBuilder: (context, index) {
              final track = tracks[index];

              return _TrackItem(
                track: track,
                bloc: ref.watch(Di.bloc.track(track)),
                key: ValueKey(track.id),
              );
            },
          );
        },
        loading: () => const ShimmerList(),
        error: () => const SizedBox.shrink().toSliver(),
      ),
    );
  }
}

class _TrackItem extends StatelessWidget {
  final Track track;
  final TrackBloc bloc;

  const _TrackItem({
    required this.track,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TrackItem(
        track: track,
        onTap: bloc.onTrackTap,
        trackIsDownloadedStream: bloc.trackIsDownloadedStream,
        trackIsLikedStream: bloc.trackLikedStream,
        onTrackLiked: bloc.onTrackLiked,
      );
}
