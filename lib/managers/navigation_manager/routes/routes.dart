import 'package:breathe_with_me/features/faq/faq_page.dart';
import 'package:breathe_with_me/features/forgot_password/widgets/forgot_password_email_sent.dart';
import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/create_account_modal_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_paywall/premium_paywall.dart';
import 'package:breathe_with_me/features/profile/profile_page.dart';
import 'package:breathe_with_me/features/profile/widgets/language_sheet.dart';
import 'package:breathe_with_me/features/profile_settings/profile_settings_page.dart';
import 'package:breathe_with_me/features/reminder/reminder_page.dart';
import 'package:breathe_with_me/features/safety_precautions/safety_precautions_page.dart';
import 'package:breathe_with_me/features/streak/streak_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/tracks_filter_type.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filter_sheet.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_modal_page.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class BWMRoutes {
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const player = '/track-player';
  static const profile = '/profile';
  static const createAccount = '/create-account';
  static const reminderPage = '/reminder-page';
  static const languageSheet = '/language-sheet';
  static const faq = '/faq';
  static const safetyPrecautions = '/safety-precautions';
  static const filtersSheet = '/filters-sheet';
  static const streak = '/streak';
  static const profileSettings = '/profile-settings';
  static const premiumPaywall = '/premium-paywall';
  static const passwordEmailSent = '/password-email-sent';

  static const auth = AuthRoutes();

  static final routes = <RouteBase>[
    ...auth.createAuthRoutes(),
    GoRoute(
      path: BWMRoutes.onboarding,
      builder: (BuildContext context, GoRouterState state) =>
          const OnboardingPage(),
    ),
    GoRoute(
      path: BWMRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: BWMRoutes.profile,
      builder: (context, state) => const ProfilePage(),
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
      pageBuilder: (context, state) => const BWMModalPage(
        barrierColor: Colors.black,
        isScrollControlled: true,
        useSafeArea: true,
        enableDrag: false,
        child: CreateAccountModalPage(),
      ),
    ),
    GoRoute(
      path: BWMRoutes.languageSheet,
      pageBuilder: (context, state) => const BWMModalPage(
        backgroundColor: Colors.transparent,
        child: LanguageSheet(),
      ),
    ),
    GoRoute(
      path: BWMRoutes.reminderPage,
      builder: (context, state) => const ReminderPage(),
    ),
    GoRoute(
      path: BWMRoutes.faq,
      builder: (context, state) => const FaqPage(),
    ),
    GoRoute(
      path: BWMRoutes.safetyPrecautions,
      pageBuilder: (context, state) => const BWMModalPage(
        useSafeArea: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.black,
        child: SafetyPrecautionsPage(),
      ),
    ),
    GoRoute(
      path: BWMRoutes.filtersSheet,
      pageBuilder: (context, state) => BWMModalPage(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        child: TracksFilterSheet(
          filterType: state.extra! as TracksFilterType,
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.premiumPaywall,
      pageBuilder: (context, state) {
        final topInset = MediaQuery.of(context).viewPadding.top;
        return BWMModalPage(
          barrierColor: Colors.black,
          isDismissible: false,
          isScrollControlled: true,
          enableDrag: false,
          child: PremiumPaywall(
            topInset: topInset,
          ),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.streak,
      pageBuilder: (context, state) {
        final track = state.extra! as Track;
        return BWMModalPage(
          barrierColor: Colors.transparent,
          useSafeArea: true,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.black,
          child: StreakPage(track: track),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.profileSettings,
      builder: (context, state) => const ProfileSettingsPage(),
    ),
    GoRoute(
      path: BWMRoutes.passwordEmailSent,
      pageBuilder: (context, state) {
        return const BWMModalPage(
          useSafeArea: true,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          child: ForgotPasswordEmailSentPage(),
        );
      },
    ),
  ];
}
