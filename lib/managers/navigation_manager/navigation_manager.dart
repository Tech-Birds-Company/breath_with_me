import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavigationManager {
  late final router = GoRouter(
    initialLocation: BWMRoutes.onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: BWMRoutes.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: BWMRoutes.home,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: BWMRoutes.player,
        builder: (context, state) {
          final trackId = state.uri.queryParameters['trackId']!;
          return TrackPlayerPage(
            trackId: trackId,
          );
        },
      ),
    ],
  );

  void openTrackPlayer(String trackId) {
    router.push(
      Uri(path: BWMRoutes.player, queryParameters: {'trackId': trackId})
          .toString(),
    );
  }
}
