import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/create_account_modal_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/profile/profile_page.dart';
import 'package:breathe_with_me/features/reminder/reminder_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class BWMRoutes {
  const BWMRoutes._();

  static const onboarding = '/onboarding';
  static const home = '/home';
  static const player = '/track-player';
  static const profile = '/profile';
  static const createAccount = '/create-account';
  static const reminderPage = '/reminder-page';

  static final routes = <RouteBase>[
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
    GoRoute(
      path: BWMRoutes.createAccount,
      builder: (context, state) {
        return const CreateAccountModalPage();
      },
    ),
    GoRoute(
      path: BWMRoutes.reminderPage,
      builder: (context, state) {
        return const ReminderPage();
      },
    ),
  ];
}
