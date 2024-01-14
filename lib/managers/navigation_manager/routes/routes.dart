import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/faq/faq_page.dart';
import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/create_account_modal_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_paywall/premium_paywall.dart';
import 'package:breathe_with_me/features/profile/blocs/profile_bloc.dart';
import 'package:breathe_with_me/features/profile/profile_page.dart';
import 'package:breathe_with_me/features/profile/widgets/language_sheet.dart';
import 'package:breathe_with_me/features/profile_settings/account_settings_page.dart';
import 'package:breathe_with_me/features/reminder/blocs/reminder_bloc.dart';
import 'package:breathe_with_me/features/reminder/reminder_page.dart';
import 'package:breathe_with_me/features/safety_precautions/safety_precautions_page.dart';
import 'package:breathe_with_me/features/streak/streak_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:breathe_with_me/features/tracks/filter_type.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filter_sheet.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_modal_page.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes/auth_routes.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:breathe_with_me/utils/multi_dependency_provider.dart';
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

  static const auth = AuthRoutes();

  static final routes = <RouteBase>[
    ...auth.createAuthRoutes(),
    GoRoute(
      path: BWMRoutes.onboarding,
      builder: (BuildContext context, GoRouterState state) =>
          DependencyProvider(
        provider: Di.shared.bloc.onboarding,
        builder: (context, dependency) => OnboardingPage(bloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.home,
      builder: (context, state) => DependencyProvider(
        provider: Di.shared.bloc.home,
        builder: (context, dependency) => HomePage(homeBloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.profile,
      builder: (context, state) =>
          MultiDependencyProvider2<ProfileBloc, ReminderBloc>(
        providers: (
          Di.shared.bloc.profile,
          Di.shared.bloc.reminder,
        ),
        builder: (context, dependencies) => ProfilePage(
          profileBloc: dependencies.$1,
          reminderBloc: dependencies.$2,
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.player,
      builder: (context, state) {
        final track = state.extra! as Track;
        return DependencyProvider(
          provider: Di.shared.bloc.trackPlayer(track),
          builder: (context, dependency) => TrackPlayerPage(bloc: dependency),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.createAccount,
      pageBuilder: (context, state) => BWMModalPage(
        barrierColor: Colors.black,
        isScrollControlled: true,
        useSafeArea: true,
        enableDrag: false,
        child: DependencyProvider(
          provider: Di.shared.bloc.onboarding,
          builder: (context, dependency) => CreateAccountModalPage(
            bloc: dependency,
          ),
        ),
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
      builder: (context, state) => DependencyProvider(
        provider: Di.shared.bloc.reminder,
        builder: (context, dependency) => ReminderPage(bloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.faq,
      builder: (context, state) => DependencyProvider(
        provider: Di.shared.bloc.faq,
        builder: (context, dependency) => FaqPage(bloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.safetyPrecautions,
      pageBuilder: (context, state) => BWMModalPage(
        barrierColor: Colors.transparent,
        useSafeArea: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        child: DependencyProvider(
          provider: Di.shared.bloc.safetyPrecautions,
          builder: (context, dependency) => SafetyPrecautionsPage(
            bloc: dependency,
          ),
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.filtersSheet,
      pageBuilder: (context, state) => BWMModalPage(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        child: DependencyProvider(
          provider: Di.shared.bloc.tracksFilters,
          builder: (context, dependency) => TracksFilterSheet(
            bloc: dependency,
            filterType: state.extra! as FilterType,
          ),
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
          child: DependencyProvider(
            provider: Di.shared.manager.subscriptions,
            builder: (context, dependency) => PremiumPaywall(
              topInset: topInset,
              subscriptionsManager: dependency,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.streak,
      builder: (context, state) => DependencyProvider(
        provider: Di.shared.bloc.streak,
        builder: (context, dependency) => StreakPage(bloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.profileSettings,
      builder: (context, state) => DependencyProvider(
        provider: Di.shared.bloc.profileSettings,
        builder: (context, dependency) => AccountSettingsPage(bloc: dependency),
      ),
    ),
  ];
}
