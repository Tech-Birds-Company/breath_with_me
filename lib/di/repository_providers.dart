part of 'di.dart';

final class _RepositoryProviders {
  late final tracks = Provider.autoDispose(
    (ref) => TracksRepositoryImpl(
      ref.read(Di.manager.user),
      ref.read(Di.manager.database),
      ref.read(firebaseTutors),
    ),
  );

  late final firebaseTutors =
      Provider((ref) => const FirebaseTutorsRepository());

  late final firebaseRemoteConfig = Provider.autoDispose(
    (ref) => const FirebaseRemoteConfigRepository(),
  );

  late final firebaseFaqQuestions =
      Provider.autoDispose((ref) => const FirebaseFaqQuestionsRepository());

  late final firebaseStreaksProgress =
      Provider.autoDispose((ref) => const StreaksProgressRepository());

  late final streaksQuotes =
      Provider.autoDispose((ref) => const StreaksQuotesRepository());
}
