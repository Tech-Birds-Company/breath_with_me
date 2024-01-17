import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/home/blocs/home_bloc.dart';
import 'package:breathe_with_me/features/home/widgets/home_header.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_banner_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filters.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/tracks_list.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:breathe_with_me/utils/multi_dependency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  final HomeBloc homeBloc;

  const HomePage({
    required this.homeBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        homeBloc.init();
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
              sliver: DependencyProvider(
                provider: Di.manager.navigation,
                builder: (context, navigationManager) => HomeHeader(
                  onProfileTap: navigationManager.openProfile,
                ),
              ),
            ),
            const SizedBox(height: 28).toSliver,
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              sliver: DependencyProvider(
                provider: Di.bloc.tracksFilters,
                builder: (context, tracksFiltersBloc) =>
                    TracksFilters(bloc: tracksFiltersBloc).toSliver,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              sliver:
                  MultiDependencyProvider2<TracksListBloc, PremiumBannerBloc>(
                providers: (Di.bloc.tracksList, Di.bloc.premiumBanner),
                builder: (context, dependencies) => TracksList(
                  tracksListBloc: dependencies.$1,
                  premiumBloc: dependencies.$2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
