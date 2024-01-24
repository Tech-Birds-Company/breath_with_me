import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/home/widgets/home_header.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filters.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_list/tracks_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationManager = ref.watch(Di.manager.navigation);

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
                onProfileTap: navigationManager.openProfile,
              ),
            ),
            const SizedBox(height: 28).toSliver(),
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              sliver: const TracksFilters().toSliver(),
            ),
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
