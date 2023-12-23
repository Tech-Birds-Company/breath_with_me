part of 'di.dart';

final class _RepositoryProviders {
  late final tracks = Provider(
    (ref) => TracksRepositoryImpl(
      ref.read(Di.shared.manager.user),
      ref.read(Di.shared.manager.database),
      ref.read(firebaseTutors),
    ),
  );

  late final firebaseTutors =
      Provider((ref) => const FirebaseTutorsRepository());

  late final firebaseRemoteConfig = Provider(
    (ref) => const FirebaseRemoteConfigRepository(),
  );

  late final firebaseFaqQuestions =
      Provider((ref) => const FirebaseFaqQuestionsRepository());

  late final firebaseStreaksProgress =
      Provider((ref) => const StreaksProgressRepository());
}
