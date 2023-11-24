part of 'di.dart';

final class _RepositoryProviders {
  late final firebaseTracks = Provider.autoDispose(
    (ref) => FirebaseTracksRepository(
      ref.read(Di.shared.repository.firebaseTutors),
      ref.read(Di.shared.manager.database),
    ),
  );

  late final firebaseTutors =
      Provider.autoDispose((ref) => const FirebaseTutorsRepository());

  late final firebaseQuestions =
      Provider.autoDispose((ref) => const FirebaseQuestionsRepository());
}
