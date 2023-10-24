part of 'di.dart';

final class _RepositoryProviders {
  late final tracks = Provider.autoDispose(
    (ref) => TracksRepository(
      ref.read(Di.shared.repository.tutor),
      ref.read(Di.shared.manager.database),
    ),
  );

  late final tutor = Provider.autoDispose((ref) => const TutorRepository());
}
