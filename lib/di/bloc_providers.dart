part of 'di.dart';

final class _BlocProviders {
  late final tracksList = Provider.autoDispose(
    (ref) {
      final bloc = TracksListBloc(
        ref.watch(Di.repository.tracks),
        ref.watch(Di.bloc.tracksFilters),
      )..init();
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final home = Provider.autoDispose(
    (ref) => HomeBloc(
      ref.watch(Di.manager.permissions),
      ref.watch(Di.manager.sharedPreferences),
      ref.watch(Di.manager.navigation),
    )..init(),
  );

  late final trackPlayer = Provider.family.autoDispose<TrackPlayerBloc, Track>(
    (ref, trackId) {
      final bloc = TrackPlayerBloc(
        trackId,
        ref.watch(Di.manager.audio),
        ref.watch(Di.repository.tracks),
        ref.watch(Di.manager.user),
        ref.watch(Di.manager.tracksDownloader),
        ref.watch(Di.manager.streakProgress),
        ref.watch(Di.manager.navigation),
      )..init();
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final onboarding = Provider.autoDispose(
    (ref) => OnboardingBloc(
      ref.watch(Di.manager.navigation),
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.deeplink),
    ),
  );

  late final profile = Provider.autoDispose(
    (ref) {
      final bloc = ProfileBloc(
        ref.watch(Di.manager.navigation),
        ref.watch(Di.manager.pushNotifications),
        ref.watch(Di.manager.permissions),
        ref.watch(Di.manager.user),
        ref.watch(Di.manager.subscriptions),
        ref.watch(Di.manager.deeplink),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final faq = Provider.autoDispose(
    (ref) => FaqBloc(
      ref.watch(Di.repository.firebaseFaqQuestions),
    ),
  );

  late final reminder = Provider.autoDispose(
    (ref) => ReminderBloc(
      ref.watch(Di.manager.pushNotifications),
    ),
  );

  late final safetyPrecautions = Provider.autoDispose(
    (ref) => SafetyPrecautionsBloc(
      ref.watch(Di.manager.navigation),
      ref.watch(Di.manager.sharedPreferences),
    ),
  );

  late final track = Provider.family.autoDispose<TrackBloc, Track>(
    (ref, track) => TrackBloc(
      track,
      ref.watch(Di.repository.tracks),
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.navigation),
    ),
  );

  late final tracksFilters = Provider.autoDispose(
    (ref) {
      final bloc = TracksFiltersBloc(
        ref.watch(Di.repository.tracks),
        ref.watch(Di.manager.navigation),
      )..init();
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final signUp = Provider.autoDispose(
    (ref) => SignUpBloc(
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.navigation),
    ),
  );

  late final signIn = Provider.autoDispose(
    (ref) => SignInBloc(
      ref.watch(Di.manager.navigation),
      ref.watch(Di.manager.user),
    ),
  );

  late final forgotPassword = Provider.autoDispose(
    (ref) => ForgotPasswordBloc(
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.deeplink),
    ),
  );

  late final streak = Provider.autoDispose(
    (ref) {
      final bloc = StreakBloc(
        ref.watch(Di.manager.streakProgress),
        ref.watch(Di.manager.subscriptions),
        ref.watch(Di.manager.navigation),
      )..init();
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final accountSettings = Provider.autoDispose(
    (ref) => AccountSettingsBloc(
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.navigation),
    ),
  );

  late final premiumBanner = Provider.autoDispose(
    (ref) {
      final bloc = PremiumBannerBloc(
        ref.watch(Di.repository.firebaseRemoteConfig),
        ref.watch(Di.manager.subscriptions),
        ref.watch(Di.manager.navigation),
      )..init();
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final premiumPaywall = Provider.autoDispose(
    (ref) => PremiumPaywallBloc(
      ref.watch(Di.manager.subscriptions),
      ref.watch(Di.repository.firebaseRemoteConfig),
      ref.watch(Di.manager.navigation),
    )..init(),
  );
}
