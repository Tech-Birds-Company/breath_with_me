part of 'di.dart';

final class _RepositoryProviders {
  late final tracks = Provider(
    (ref) => TracksRepositoryImpl(
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.database),
      ref.watch(firebaseTutors),
    ),
  );

  late final firebaseTutors = Provider(
    (ref) => const FirebaseTutorsRepository(),
  );

  late final firebaseRemoteConfig = Provider(
    (ref) => const FirebaseRemoteConfigRepository(),
  );

  late final firebaseFaqQuestions = Provider(
    (ref) => const FirebaseFaqQuestionsRepository(),
  );

  late final firebaseStreaksProgress = Provider(
    (ref) => StreakProgressRepositoryV2(
      FirebaseFirestore.instance,
      ref.watch(Di.repository.firebaseRemoteConfig),
    ),
  );

  late final streaksQuotes = Provider(
    (ref) => const StreaksQuotesRepository(),
  );
}
