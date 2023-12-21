import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/faq/faq_page.dart';
import 'package:breathe_with_me/features/home/blocs/home_bloc.dart';
import 'package:breathe_with_me/features/home/home_page.dart';
import 'package:breathe_with_me/features/onboarding/create_account_modal_page.dart';
import 'package:breathe_with_me/features/onboarding/onboarding_page.dart';
import 'package:breathe_with_me/features/profile/profile_page.dart';
import 'package:breathe_with_me/features/profile/widgets/language_sheet.dart';
import 'package:breathe_with_me/features/reminder/reminder_page.dart';
import 'package:breathe_with_me/features/safety_precautions/safety_precautions_page.dart';
import 'package:breathe_with_me/features/sign_in/sign_in_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_page.dart';
import 'package:breathe_with_me/features/track_player/track_player_page.dart';
import 'package:breathe_with_me/features/tracks/filter_type.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filter_sheet.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_modal_page.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:breathe_with_me/utils/multi_dependency_provider.dart';
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
  static const filtersSheet = '/filters-sheet';
  static const signInPage = '/sign-in';
  static const signUpPage = '/sign-up';

  static final routes = <RouteBase>[
    GoRoute(
      path: BWMRoutes.onboarding,
      builder: (BuildContext context, GoRouterState state) => DependecyProvider(
        provider: Di.shared.bloc.onboarding,
        builder: (context, dependency) => OnboardingPage(bloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.home,
      builder: (context, state) =>
          MultiDependecyProvider2<HomeBloc, NavigationManager>(
        providers: (
          Di.shared.bloc.home,
          Di.shared.manager.navigation,
        ),
        builder: (context, dependencies) {
          final bloc = dependencies.$1;
          final navigationManager = dependencies.$2;

          return HomePage(
            bloc: bloc,
            navigationManager: navigationManager,
          );
        },
      ),
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
      builder: (context, state) => DependecyProvider(
        provider: Di.shared.bloc.faq,
        builder: (context, dependency) => FaqPage(bloc: dependency),
      ),
    ),
    GoRoute(
      path: BWMRoutes.safetyPrecautions,
      pageBuilder: (context, state) => const BWMModalPage(
        barrierColor: Colors.transparent,
        useSafeArea: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        child: SafetyPrecautionsPage(),
      ),
    ),
    GoRoute(
      path: BWMRoutes.filtersSheet,
      pageBuilder: (context, state) => BWMModalPage(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        child: TracksFilterSheet(state.extra! as FilterType),
      ),
    ),
    GoRoute(
      path: BWMRoutes.signInPage,
      builder: (context, state) => const SignInPageWidget(),
    ),
    GoRoute(
      path: BWMRoutes.signUpPage,
      builder: (context, state) => const SignUpPage(),
    ),
  ];
}
