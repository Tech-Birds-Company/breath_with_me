part of 'di.dart';

final class _RepositoryProviders {
  late final tracks = Provider.autoDispose(
    (ref) => TracksRepository(
      ref.read(Di.repository.tutor),
      ref.read(Di.manager.database),
    ),
  );

  late final tutor = Provider.autoDispose((ref) => const TutorRepository());
}
