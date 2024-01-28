import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/faq/faq_page.dart';
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
import 'package:breathe_with_me/features/tracks/filter_type.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/tracks_filter_sheet.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_modal_page.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes/auth_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      builder: (BuildContext context, GoRouterState state) => Consumer(
        builder: (context, ref, child) => OnboardingPage(
          bloc: ref.watch(Di.bloc.onboarding),
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.home,
      builder: (context, state) => Consumer(
        builder: (context, ref, child) => HomePage(
          navigationManager: ref.watch(Di.manager.navigation),
          tracksFiltersBloc: ref.watch(Di.bloc.tracksFilters),
          tracksListBloc: ref.watch(Di.bloc.tracksList),
          premiumBannerBloc: ref.watch(Di.bloc.premiumBanner),
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.profile,
      builder: (context, state) => Consumer(
        builder: (context, ref, child) {
          final profileBloc = ref.watch(Di.bloc.profile);
          final reminderBloc = ref.watch(Di.bloc.reminder);
          final streakBloc = ref.watch(Di.bloc.streak);

          return ProfilePage(
            profileBloc: profileBloc,
            reminderBloc: reminderBloc,
            streakBloc: streakBloc,
          );
        },
      ),
    ),
    GoRoute(
      path: BWMRoutes.player,
      builder: (context, state) {
        final track = state.extra! as Track;
        return Consumer(
          builder: (context, ref, child) {
            final bloc = ref.watch(Di.bloc.trackPlayer(track));
            return TrackPlayerPage(bloc: bloc);
          },
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
        child: Consumer(
          builder: (context, ref, child) => CreateAccountModalPage(
            bloc: ref.watch(Di.bloc.onboarding),
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
      builder: (context, state) => Consumer(
        builder: (context, ref, child) => ReminderPage(
          bloc: ref.watch(Di.bloc.reminder),
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.faq,
      builder: (context, state) => Consumer(
        builder: (context, ref, child) => FaqPage(
          bloc: ref.watch(Di.bloc.faq),
        ),
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
        child: Consumer(
          builder: (context, ref, child) => SafetyPrecautionsPage(
            bloc: ref.watch(Di.bloc.safetyPrecautions),
          ),
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.filtersSheet,
      pageBuilder: (context, state) => BWMModalPage(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        child: Consumer(
          builder: (context, ref, child) => TracksFilterSheet(
            bloc: ref.watch(Di.bloc.tracksFilters),
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
          child: Consumer(
            builder: (context, ref, child) => PremiumPaywall(
              bloc: ref.watch(Di.bloc.premiumPaywall),
              topInset: topInset,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: BWMRoutes.streak,
      pageBuilder: (context, state) => BWMModalPage(
        barrierColor: Colors.transparent,
        useSafeArea: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        child: Consumer(
          builder: (context, ref, child) => StreakPage(
            bloc: ref.watch(Di.bloc.streak),
            remoteConfigRepository: ref.watch(
              Di.repository.firebaseRemoteConfig,
            ),
          ),
        ),
      ),
    ),
    GoRoute(
      path: BWMRoutes.profileSettings,
      builder: (context, state) => Consumer(
        builder: (context, ref, child) => ProfileSettingsPage(
          bloc: ref.watch(Di.bloc.accountSettings),
        ),
      ),
    ),
  ];
}
