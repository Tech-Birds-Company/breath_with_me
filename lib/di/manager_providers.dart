part of 'di.dart';

final class _ManagerProviders {
  _ManagerProviders() {
    print('manager providers initialized');
  }

  late final tracksDownloader = Provider(
    (ref) => TracksDownloaderManager(ref.read(database)),
  );

  late final trackPlayer = Provider((ref) {
    final manager = TrackPlayerManager();
    ref.onDispose(manager.dispose);
    return manager;
  });

  late final navigation = Provider((ref) {
    return NavigationManager(
      ref.read(Di.manager.user),
    );
  });

  late final database = Provider<DatabaseManager>(
    (ref) {
      throw UnimplementedError();
    },
  );

  late final audio = Provider(
    (ref) {
      final manager = TrackAudioManager(ref.read(trackPlayer));
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  late final user = Provider((ref) => FirebaseUserManager());

  late final permissions = Provider((ref) => PermissionsManager());

  late final pushNotifications = Provider(
    (ref) => PushNotificationsManager(),
  );

  late final subscriptions =
      Provider<SubscriptionsManager>((ref) => throw UnimplementedError());

  late final sharedPreferences = Provider((ref) => SharedPreferencesManager());
}
