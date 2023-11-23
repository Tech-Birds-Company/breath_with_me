part of 'di.dart';

final class _ManagerProviders {
  late final tracksDownloader = Provider(
    (ref) => TracksDownloaderManager(
      ref.read(Di.shared.manager.database),
    ),
  );

  late final trackPlayer = Provider.autoDispose((ref) {
    final manager = TrackPlayerManager();
    ref.onDispose(manager.dispose);
    return manager;
  });

  late final navigation = Provider((ref) => NavigationManager());

  late final database = Provider<DatabaseManager>(
    (ref) {
      throw UnimplementedError();
    },
  );

  late final audio = Provider.autoDispose(
    (ref) {
      final manager = TrackAudioManager(
        ref.read(Di.shared.manager.trackPlayer),
      );
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  late final userManager = Provider((ref) => FirebaseUserManager());
}
