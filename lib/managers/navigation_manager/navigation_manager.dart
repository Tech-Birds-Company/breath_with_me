import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/profile/profile_page.dart';
import 'package:breathe_with_me/features/sign_in/sign_in_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes.dart';
import 'package:go_router/go_router.dart';

final class NavigationManager {
  late final router = GoRouter(
    initialLocation: BWMRoutes.onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: BWMRoutes.onboarding,
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: BWMRoutes.signIn,
        builder: (context, state) {
          return const SignInPageWidget();
        },
      ),
      GoRoute(
        path: BWMRoutes.signUp,
        builder: (context, state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        path: BWMRoutes.home,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: BWMRoutes.profile,
        builder: (context, state) {
          return const ProfilePage();
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
    final uri = Uri(
      path: BWMRoutes.player,
      queryParameters: {'trackId': trackId},
    );
    router.push(uri.toString());
  }

  void openProfile() {
    router.push(BWMRoutes.profile);
  }
}
