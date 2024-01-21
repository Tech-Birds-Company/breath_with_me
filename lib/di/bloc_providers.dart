part of 'di.dart';

final class _BlocProviders {
  late final tracksList = Provider(
    (ref) {
      final bloc = TracksListBloc(
        ref.read(Di.repository.tracks),
        ref.read(Di.bloc.tracksFilters).stream,
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final home = Provider(
    (ref) => HomeBloc(
      ref.read(Di.manager.permissions),
      ref.read(Di.manager.sharedPreferences),
      ref.read(Di.manager.navigation),
    ),
  );

  late final trackPlayer = Provider.family<TrackPlayerBloc, Track>(
    (ref, trackId) {
      final bloc = TrackPlayerBloc(
        trackId,
        ref.read(Di.manager.audio),
        ref.read(Di.repository.tracks),
        ref.read(Di.manager.user),
        ref.read(Di.manager.tracksDownloader),
        ref.read(Di.manager.navigation),
        ref.read(Di.manager.subscriptions),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final onboarding = Provider(
    (ref) => OnboardingBloc(
      ref.read(Di.manager.navigation),
      ref.read(Di.manager.user),
      ref.read(Di.repository.firebaseRemoteConfig),
    ),
  );

  late final profile = Provider(
    (ref) => ProfileBloc(
      ref.read(Di.manager.navigation),
      ref.read(Di.manager.pushNotifications),
      ref.read(Di.manager.permissions),
      ref.read(Di.repository.firebaseRemoteConfig),
      ref.read(Di.manager.user),
      ref.read(Di.manager.database),
      ref.read(Di.manager.subscriptions),
      ref.read(Di.repository.firebaseStreaksProgress),
    ),
  );

  late final faq = Provider(
    (ref) => FaqBloc(
      ref.read(Di.repository.firebaseFaqQuestions),
    ),
  );

  late final reminder = Provider.autoDispose(
    (ref) => ReminderBloc(
      ref.read(Di.manager.pushNotifications),
    ),
  );

  late final safetyPrecautions = Provider(
    (ref) => SafetyPrecautionsBloc(
      ref.read(Di.manager.navigation),
      ref.read(Di.manager.sharedPreferences),
    ),
  );

  late final track = Provider.family<TrackBloc, Track>(
    (ref, track) => TrackBloc(
      track,
      ref.read(Di.repository.tracks),
      ref.read(Di.manager.navigation),
    ),
  );

  late final tracksFilters = Provider(
    (ref) {
      final bloc = TracksFiltersBloc(
        ref.read(Di.repository.tracks),
        ref.read(Di.manager.navigation),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final signUp = Provider.autoDispose(
    (ref) => SignUpBloc(
      ref.read(Di.manager.user),
      ref.read(Di.manager.navigation),
    ),
  );

  late final signIn = Provider.autoDispose(
    (ref) => SignInBloc(
      ref.read(Di.manager.navigation),
      ref.read(Di.manager.user),
    ),
  );

  late final forgotPassword = Provider.autoDispose(
    (ref) => ForgotPasswordBloc(
      ref.read(Di.manager.user),
      ref.read(Di.repository.firebaseRemoteConfig),
    ),
  );

  late final streak = Provider.family.autoDispose<StreakBloc, (Track, Locale)>(
    (ref, input) {
      final bloc = StreakBloc(
        input.$1,
        input.$2,
        ref.read(Di.repository.firebaseRemoteConfig),
        ref.read(Di.repository.firebaseStreaksProgress),
        ref.read(Di.repository.streaksQuotes),
        ref.read(Di.manager.user),
        ref.read(Di.manager.navigation),
        ref.read(Di.manager.subscriptions),
      );
      return bloc;
    },
  );

  late final profileSettings = Provider.autoDispose(
    (ref) => AccountSettingsBloc(
      ref.read(Di.manager.user),
      ref.read(Di.manager.navigation),
    ),
  );

  late final premiumBanner = Provider.autoDispose(
    (ref) => PremiumBannerBloc(
      ref.read(Di.repository.firebaseRemoteConfig),
      ref.read(Di.manager.subscriptions),
      ref.read(Di.manager.navigation),
    ),
  );

  late final premiumPaywall = Provider(
    (ref) => PremiumPaywallBloc(
      ref.read(Di.manager.subscriptions),
      ref.read(Di.repository.firebaseRemoteConfig),
      ref.read(Di.manager.navigation),
    ),
  );
}
