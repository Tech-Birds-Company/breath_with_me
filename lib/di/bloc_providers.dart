part of 'di.dart';

final class _BlocProviders {
  late final practiceList = Provider(
    (ref) => PracticeListBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.repository.firebaseTracks),
    ),
  );

  late final home = Provider(
    (ref) => HomeBloc(
      ref.read(Di.shared.manager.permissions),
      ref.read(Di.shared.manager.sharedPreferences),
      ref.read(Di.shared.manager.navigation),
    ),
  );

  late final trackPlayer = Provider.family.autoDispose<TrackPlayerBloc, Track>(
    (ref, trackId) {
      final bloc = TrackPlayerBloc(
        trackId,
        ref.read(Di.shared.repository.firebaseTracks),
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
      ref.read(Di.shared.manager.userManager),
    ),
  );

  late final profile = Provider(
    (ref) => ProfileBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.manager.pushNotifications),
      ref.read(Di.shared.manager.permissions),
      ref.read(Di.shared.repository.firebaseRemoteConfig),
      ref.read(Di.shared.manager.userManager),
    ),
  );

  late final faq = Provider(
    (ref) => FaqBloc(
      ref.read(Di.shared.repository.firebaseFaqQuestions),
    ),
  );

  late final reminder = Provider.autoDispose(
    (ref) => ReminderBloc(
      ref.read(Di.shared.manager.pushNotifications),
    ),
  );

  late final safetyPrecautions = Provider.autoDispose(
    (ref) => SafetyPrecautionsBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.manager.sharedPreferences),
    ),
  );

  late final streak = Provider(
    (ref) => StreakBloc(
      ref.read(Di.shared.manager.navigation),
    ),
  );
}
