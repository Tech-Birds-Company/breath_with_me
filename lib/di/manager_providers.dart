part of 'di.dart';

final class _ManagerProviders {
  late final tracksDownloader = Provider(
    (ref) => TracksDownloaderManager(
      ref.read(Di.manager.database),
    ),
  );

  late final trackPlayer =
      Provider.family<TrackPlayerManager, String>((ref, trackId) {
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
}
