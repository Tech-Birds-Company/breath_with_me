import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/home/blocs/home_bloc.dart';
import 'package:breathe_with_me/features/home/widgets/home_header.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_banner_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filters.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/tracks_list.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  final HomeBloc bloc;
  final NavigationManager navigationManager;
  final TracksFiltersBloc tracksFiltersBloc;
  final TracksListBloc tracksListBloc;
  final PremiumBannerBloc premiumBannerBloc;
  final UserManager userManager;

  const HomePage({
    required this.bloc,
    required this.navigationManager,
    required this.tracksFiltersBloc,
    required this.tracksListBloc,
    required this.premiumBannerBloc,
    required this.userManager,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        bloc.init();
        return null;
      },
      const [],
    );
    return Scaffold(
      backgroundColor: Colors.black, // TODO(vasidmi): use theme
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.only(
                top: 28,
                start: 24,
                end: 24,
              ),
              sliver: HomeHeader(
                username: userManager.currentUser?.displayName ?? '',
                onProfileTap: navigationManager.openProfile,
              ),
            ),
            const SizedBox(height: 28).toSliver(),
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              sliver: TracksFilters(
                bloc: tracksFiltersBloc,
              ).toSliver(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              sliver: TracksList(
                tracksListBloc: tracksListBloc,
                premiumBannerBloc: premiumBannerBloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
