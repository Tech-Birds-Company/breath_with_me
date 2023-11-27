part of 'di.dart';

final class _RepositoryProviders {
  late final firebaseTracks = Provider.autoDispose(
    (ref) => FirebaseTracksRepository(
      ref.read(firebaseTutors),
      ref.read(Di.shared.manager.database),
    ),
  );

  late final firebaseTutors =
      Provider.autoDispose((ref) => const FirebaseTutorsRepository());

  late final firebaseRemoteConfig = Provider.autoDispose(
    (ref) => FirebaseRemoteConfigRepository(
      ref.read(Di.shared.manager.database),
    ),
  );

  late final firebaseFaqQuestions =
      Provider.autoDispose((ref) => const FirebaseFaqQuestionsRepository());
}
