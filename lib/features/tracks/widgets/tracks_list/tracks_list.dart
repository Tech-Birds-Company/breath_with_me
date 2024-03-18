import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_banner_tracks.dart';
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

    final premiumBannerBloc = ref.watch(Di.bloc.premiumBanner);
    final tracksListBloc = ref.watch(Di.bloc.tracksList);

    return BlocBuilder<TracksListBloc, TracksListState>(
      bloc: tracksListBloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) => state.when(
        data: (tracks) {
          final premiumBannerState = premiumBannerBloc.state;
          final premiumBannerTracksEnabled =
              premiumBannerState.premiumBannerTracksEnabled;
          final premiumBannerTracksWasHidden =
              premiumBannerState.premiumBannerTracksWasHidden;

          final shouldShowPremiumBanner = !premiumBannerState.isPremiumUser &&
              premiumBannerTracksEnabled &&
              !premiumBannerTracksWasHidden;

          final itemsCount = tracks.length + (shouldShowPremiumBanner ? 1 : 0);
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
              if (shouldShowPremiumBanner &&
                  index ==
                      premiumBannerState.premiumBannerTracksPosition.clamp(
                        0,
                        itemsCount - 1,
                      )) {
                return PremiumBannerTracks(
                  onBannerHide: premiumBannerBloc.onUserHidePremiumBanner,
                );
              }
              final adjustedIndex = shouldShowPremiumBanner
                  ? index -
                      (index > premiumBannerState.premiumBannerTracksPosition
                          ? 1
                          : 0)
                  : index;
              final track = tracks[adjustedIndex];
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
        trackIsLockedStream: bloc.trackIsLockedStream,
        onTap: bloc.onTrackTap,
        trackIsDownloadedStream: bloc.trackIsDownloadedStream,
        trackIsLikedStream: bloc.trackLikedStream,
        onTrackLiked: bloc.onTrackLiked,
      );
}
