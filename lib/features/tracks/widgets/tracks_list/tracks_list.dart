import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_banner_bloc.dart';
import 'package:breathe_with_me/features/premium/models/premium_banner_state.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_banner_tracks.dart';
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
  final TracksListBloc tracksListBloc;
  final PremiumBannerBloc premiumBloc;

  const TracksList({
    required this.tracksListBloc,
    required this.premiumBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        tracksListBloc.init();
        return tracksListBloc.dispose;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BlocBuilder<TracksListBloc, TracksListState>(
      bloc: tracksListBloc,
      builder: (context, tracksListState) => tracksListState.when(
        data: (tracks) => BlocBuilder<PremiumBannerBloc, PremiumBannerState>(
          bloc: premiumBloc,
          builder: (context, premiumBannerState) {
            final premiumBannerEnabled = premiumBloc.premiumBannerEnabled;
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
                    bloc: premiumBloc,
                    selector: (state) => state.premiumBannerTracksWasHidden,
                    builder: (context, premiumBannerIsHidden) =>
                        PremiumBannerTracks(
                      premiumBannerIsHidden: premiumBannerIsHidden,
                      onBannerHide: premiumBloc.onUserHidePremiumBanner,
                      onLearnMore: premiumBloc.onUserLearnMoreAboutPremium,
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
                return DependencyProvider(
                  provider: Di.bloc.track(track),
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
        ),
        loading: () {
          return const ShimmerList();
        },
        error: () {
          return const SizedBox.shrink().toSliver;
        },
      ),
    );
  }
}
