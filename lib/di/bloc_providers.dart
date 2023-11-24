part of 'di.dart';

final class _BlocProviders {
  late final practiceList = Provider(
    (ref) => PracticeListBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.repository.firebaseTracks),
    ),
  );

  late final trackPlayer = Provider.family<TrackPlayerBloc, String>(
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

  late final faq = Provider(
    (ref) => FaqBloc(
      ref.read(Di.shared.repository.firebaseFaqQuestions),
    ),
  );
}
