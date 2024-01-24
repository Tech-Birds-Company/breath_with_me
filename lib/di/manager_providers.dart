part of 'di.dart';

final class _ManagerProviders {
  late final audio = Provider<AudioManager>(
    (_) => throw UnimplementedError(),
  );

  late final tracksDownloader = Provider.autoDispose(
    (ref) => TracksDownloaderManager(ref.read(database)),
  );

  late final navigation = Provider(
    (ref) {
      final manager = NavigationManager(
        ref.read(Di.manager.user),
      );
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  late final database = Provider<DatabaseManager>(
    (ref) {
      throw UnimplementedError();
    },
  );

  late final user = Provider.autoDispose(
    (ref) => FirebaseUserManager(
      ref.read(Di.manager.subscriptions),
    ),
  );

  late final permissions = Provider.autoDispose((ref) => PermissionsManager());

  late final pushNotifications = Provider(
    (ref) => PushNotificationsManager(),
  );

  late final subscriptions =
      Provider<SubscriptionsManager>((ref) => throw UnimplementedError());

  late final sharedPreferences = Provider((ref) => SharedPreferencesManager());

  late final deeplink = Provider(
    (ref) => DeeplinkManager(
      ref.read(Di.repository.firebaseRemoteConfig),
    ),
  );

  late final streakProgress = Provider(
    (ref) {
      final userId = ref.read(Di.manager.user).currentUser!.uid;
      final manager = StreakProgressManager(
        userId,
        ref.read(Di.repository.firebaseStreaksProgress),
      );
      ref.onDispose(manager.dispose);
      return manager;
    },
  );
}
