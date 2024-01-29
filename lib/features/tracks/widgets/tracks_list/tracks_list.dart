import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_banner_bloc.dart';
import 'package:breathe_with_me/features/premium/models/premium_banner_state.dart';
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

class TracksList extends StatelessWidget {
  final TracksListBloc tracksListBloc;
  final PremiumBannerBloc premiumBannerBloc;

  const TracksList({
    required this.tracksListBloc,
    required this.premiumBannerBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BlocBuilder<TracksListBloc, TracksListState>(
      bloc: tracksListBloc,
      builder: (context, tracksListState) => tracksListState.when(
        data: (tracks) => BlocBuilder<PremiumBannerBloc, PremiumBannerState>(
          bloc: premiumBannerBloc,
          builder: (context, premiumBannerState) {
            final premiumBannerTracksEnabled =
                premiumBannerState.premiumBannerTracksEnabled;
            final premiumBannerTracksWasHidden =
                premiumBannerState.premiumBannerTracksWasHidden;

            final shouldShowPremiumBanner =
                !premiumBannerState.premiumEnabled &&
                    premiumBannerTracksEnabled &&
                    !premiumBannerTracksWasHidden;

            final itemsCount =
                tracks.length + (shouldShowPremiumBanner ? 1 : 0);
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
                    onLearnMore: premiumBannerBloc.onUserLearnMoreAboutPremium,
                  );
                }
                final adjustedIndex = shouldShowPremiumBanner
                    ? index -
                        (index > premiumBannerState.premiumBannerTracksPosition
                            ? 1
                            : 0)
                    : index;
                final track = tracks[adjustedIndex];
                return Consumer(
                  builder: (context, ref, child) => _TrackItem(
                    track: track,
                    bloc: ref.watch(Di.bloc.track(track)),
                    key: ValueKey(track.id),
                  ),
                );
              },
            );
          },
        ),
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
        trackIsLocked: bloc.trackIsLocked,
        onTap: bloc.onTrackTap,
        trackIsDownloadedStream: bloc.trackIsDownloadedStream,
        trackIsLikedStream: bloc.trackLikedStream,
        onTrackLiked: bloc.onTrackLiked,
      );
}
