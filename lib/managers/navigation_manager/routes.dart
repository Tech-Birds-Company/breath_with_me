import 'package:breathe_with_me/features/faq/faq_page.dart';
import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/create_account_modal_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/profile/profile_page.dart';
import 'package:breathe_with_me/features/profile/widgets/language_sheet.dart';
import 'package:breathe_with_me/features/reminder/reminder_page.dart';
import 'package:breathe_with_me/features/safety_precautions/safety_precautions_page.dart';
import 'package:breathe_with_me/features/streak/streak_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_modal_page.dart';
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
  static const languageSheet = '/language-sheet';
  static const faq = '/faq';
  static const safetyPrecautions = '/safety-precautions';
  static const streak = '/streak';

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
        final track = state.extra! as Track;
        return TrackPlayerPage(track: track);
      },
    ),
    GoRoute(
      path: BWMRoutes.createAccount,
      pageBuilder: (context, state) {
        return const BWMModalPage(
          barrierColor: Colors.black,
          isScrollControlled: true,
          useSafeArea: true,
          enableDrag: false,
          child: CreateAccountModalPage(),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.languageSheet,
      pageBuilder: (context, state) {
        return const BWMModalPage(
          backgroundColor: Colors.transparent,
          child: LanguageSheet(),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.reminderPage,
      builder: (context, state) {
        return const ReminderPage();
      },
    ),
    GoRoute(
      path: BWMRoutes.faq,
      builder: (context, state) {
        return const FaqPage();
      },
    ),
    GoRoute(
      path: BWMRoutes.safetyPrecautions,
      pageBuilder: (context, state) {
        return const BWMModalPage(
          barrierColor: Colors.transparent,
          useSafeArea: true,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          child: SafetyPrecautionsPage(),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.streak,
      pageBuilder: (context, state) {
        return const BWMModalPage(
          barrierColor: Colors.transparent,
          isScrollControlled: true,
          useSafeArea: true,
          enableDrag: false,
          child: StreakPage(),
        );
      },
    ),
  ];
}
