import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/home/widgets/home_header.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_banner_tracks.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filters.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/tracks_list.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.bloc.home);
    useEffect(
      () {
        BWMAnalytics.logScreenView('HomePage');
        bloc.init();
        return null;
      },
      const [],
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsetsDirectional.only(
                top: 28,
                start: 24,
                end: 24,
              ),
              sliver: HomeHeader(),
            ),
            const SizedBox(height: 28).toSliver(),
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              sliver: const TracksFilters().toSliver(),
            ),
            StreamBuilder<bool>(
              initialData: false,
              stream: ref.watch(Di.manager.user).isPremiumUserStream,
              builder: (context, snapshot) {
                final isPremiumEnabled = snapshot.requireData;
                return isPremiumEnabled
                    ? const SizedBox.shrink()
                    : const PremiumBannerTracks();
              },
            ).toSliver(),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              sliver: TracksList(),
            ),
          ],
        ),
      ),
    );
  }
}
