import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_banner_bloc.dart';
import 'package:breathe_with_me/features/premium/models/premium_banner_state.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_banner_tracks.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_item.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/shimmer_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TracksList extends HookConsumerWidget {
  const TracksList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracksListBloc = ref.watch(Di.bloc.tracksList);
    final premiumBannerBloc = ref.read(Di.bloc.premiumBanner);

    useEffect(
      () => tracksListBloc.dispose,
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BlocBuilder<TracksListBloc, TracksListState>(
      bloc: tracksListBloc,
      builder: (context, tracksListState) => tracksListState.when(
        data: (tracks) => BlocBuilder<PremiumBannerBloc, PremiumBannerState>(
          bloc: premiumBannerBloc,
          builder: (context, premiumBannerState) {
            final premiumBannerEnabled = premiumBannerBloc.premiumBannerEnabled;
            final itemsCount = tracks.length + (premiumBannerEnabled ? 1 : 0);
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
                if (premiumBannerEnabled &&
                    index ==
                        premiumBannerState.premiumBannerTracksPosition.clamp(
                          0,
                          itemsCount - 1,
                        )) {
                  return BlocSelector<PremiumBannerBloc, PremiumBannerState,
                      bool>(
                    bloc: premiumBannerBloc,
                    selector: (state) => state.premiumBannerTracksWasHidden,
                    builder: (context, premiumBannerIsHidden) =>
                        PremiumBannerTracks(
                      premiumBannerIsHidden: premiumBannerIsHidden,
                      onBannerHide: premiumBannerBloc.onUserHidePremiumBanner,
                      onLearnMore:
                          premiumBannerBloc.onUserLearnMoreAboutPremium,
                    ),
                  );
                }
                final adjustedIndex = premiumBannerEnabled
                    ? index -
                        (index > premiumBannerState.premiumBannerTracksPosition
                            ? 1
                            : 0)
                    : index;
                final track = tracks[adjustedIndex];
                return _TrackItem(
                  track,
                  key: ValueKey(track.id),
                );
              },
            );
          },
        ),
        loading: () {
          return const ShimmerList();
        },
        error: () {
          return const SizedBox.shrink().toSliver();
        },
      ),
    );
  }
}

class _TrackItem extends ConsumerWidget {
  final Track _track;

  const _TrackItem(
    this._track, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.bloc.track(_track));
    return TrackItem(
      track: _track,
      onTap: bloc.openTrackPlayer,
      trackIsDownloadedStream: bloc.trackIsDownloadedStream,
      trackIsLikedStream: bloc.trackLikedStream,
      onTrackLiked: bloc.onTrackLiked,
    );
  }
}
