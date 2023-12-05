part of 'di.dart';

final class _ManagerProviders {
  late final tracksDownloader = Provider(
    (ref) => TracksDownloaderManager(ref.read(database)),
  );

  late final trackPlayer = Provider.autoDispose((ref) {
    final manager = TrackPlayerManager();
    ref.onDispose(manager.dispose);
    return manager;
  });

  late final navigation = Provider((ref) {
    return NavigationManager(
      ref.read(Di.shared.manager.userManager),
    );
  });

  late final database = Provider<DatabaseManager>(
    (ref) {
      throw UnimplementedError();
    },
  );

  late final audio = Provider.autoDispose(
    (ref) {
      final manager = TrackAudioManager(ref.read(trackPlayer));
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  late final userManager = Provider((ref) => FirebaseUserManager());

  late final permissions = Provider((ref) => PermissionsManager());

  late final remoteConfig = Provider(
    (ref) {
      final manager = RemoteConfigManager(
        ref.read(Di.shared.repository.firebaseRemoteConfig),
      );
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  late final pushNotifications = Provider(
    (ref) => PushNotificationsManager(),
  );

  late final subscriptions =
      Provider<SubscriptionsManager>((ref) => SubscriptionsManagerImpl());
}
