part of 'di.dart';

final class _RepositoryProviders {
  late final tracks = Provider.autoDispose(
    (ref) => TracksRepositoryImpl(
      ref.watch(Di.manager.user),
      ref.watch(Di.manager.database),
      ref.watch(firebaseTutors),
    ),
  );

  late final firebaseTutors = Provider.autoDispose(
    (ref) => const FirebaseTutorsRepository(),
  );

  late final firebaseRemoteConfig = Provider.autoDispose(
    (ref) => const FirebaseRemoteConfigRepository(),
  );

  late final firebaseFaqQuestions = Provider.autoDispose(
    (ref) => const FirebaseFaqQuestionsRepository(),
  );

  late final firebaseStreaksProgress = Provider.autoDispose(
    (ref) => StreakProgressRepositoryV2(
      FirebaseFirestore.instance,
      ref.watch(Di.repository.firebaseRemoteConfig),
    ),
  );

  late final streaksQuotes = Provider.autoDispose(
    (ref) => const StreaksQuotesRepository(),
  );
}
