part of 'di.dart';

final class _BlocProviders {
  late final tracksList = Provider(
    (ref) {
      final bloc = TracksListBloc(
        ref.read(Di.shared.repository.tracks),
        ref.read(Di.shared.bloc.tracksFilters).stream,
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final home = Provider(
    (ref) => HomeBloc(
      ref.read(Di.shared.manager.permissions),
      ref.read(Di.shared.manager.sharedPreferences),
      ref.read(Di.shared.manager.navigation),
    ),
  );

  late final trackPlayer = Provider.family<TrackPlayerBloc, Track>(
    (ref, trackId) {
      final bloc = TrackPlayerBloc(
        trackId,
        ref.read(Di.shared.repository.tracks),
        ref.read(Di.shared.manager.user),
        ref.read(Di.shared.manager.audio),
        ref.read(Di.shared.manager.tracksDownloader),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final onboarding = Provider(
    (ref) => OnboardingBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.manager.user),
      ref.read(Di.shared.repository.firebaseRemoteConfig),
    ),
  );

  late final profile = Provider(
    (ref) => ProfileBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.manager.pushNotifications),
      ref.read(Di.shared.manager.permissions),
      ref.read(Di.shared.repository.firebaseRemoteConfig),
      ref.read(Di.shared.manager.user),
      ref.read(Di.shared.manager.database),
    ),
  );

  late final faq = Provider(
    (ref) => FaqBloc(
      ref.read(Di.shared.repository.firebaseFaqQuestions),
    ),
  );

  late final reminder = Provider(
    (ref) => ReminderBloc(
      ref.read(Di.shared.manager.pushNotifications),
    ),
  );

  late final safetyPrecautions = Provider(
    (ref) => SafetyPrecautionsBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.manager.sharedPreferences),
    ),
  );

  late final track = Provider.family<TrackBloc, Track>(
    (ref, track) => TrackBloc(
      track,
      ref.read(Di.shared.repository.tracks),
      ref.read(Di.shared.manager.navigation),
    ),
  );

  late final tracksFilters = Provider(
    (ref) {
      final bloc = TracksFiltersBloc(
        ref.read(Di.shared.repository.tracks),
        ref.read(Di.shared.manager.navigation),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );

  late final signUp = Provider.autoDispose(
    (ref) => SignUpBloc(
      ref.read(Di.shared.manager.user),
      ref.read(Di.shared.manager.navigation),
    ),
  );

  late final signIn = Provider.autoDispose(
    (ref) => SignInBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.manager.user),
    ),
  );

  late final forgotPassword = Provider.autoDispose(
    (ref) => ForgotPasswordBloc(
      ref.read(Di.shared.manager.user),
      ref.read(Di.shared.repository.firebaseRemoteConfig),
    ),
  );

  late final streak = Provider(
    (ref) => StreakBloc(
      ref.read(Di.shared.manager.navigation),
    ),
  );

  late final profileSettings = Provider.autoDispose(
    (ref) => AccountSettingsBloc(
      ref.read(Di.shared.manager.user),
      ref.read(Di.shared.manager.navigation),
    ),
  );

  late final premiumBanner = Provider(
    (ref) => PremiumBannerBloc(
      ref.read(Di.shared.repository.firebaseRemoteConfig),
      ref.read(Di.shared.manager.navigation),
    ),
  );
}
