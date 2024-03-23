part of 'di.dart';

final class _ManagerProviders {
  late final audio = Provider<AudioManager>(
    (_) => throw UnimplementedError(),
  );

  late final tracksDownloader = Provider.autoDispose(
    (ref) => TracksDownloaderManager(ref.watch(database)),
  );

  late final navigation = Provider.autoDispose(
    (ref) {
      final manager = NavigationManager(
        ref.watch(Di.manager.user),
      )..init();
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  late final database = Provider<DatabaseManager>(
    (ref) {
      throw UnimplementedError();
    },
  );

  late final user = Provider<FirebaseUserManager>(
    (ref) {
      throw UnimplementedError();
    },
  );

  late final permissions = Provider(
    (ref) => PermissionsManager(),
  );

  late final pushNotifications = Provider(
    (ref) => PushNotificationsManager(),
  );

  late final subscriptions =
      Provider<SubscriptionsManager>((ref) => throw UnimplementedError());

  late final sharedPreferences = Provider((ref) => SharedPreferencesManager());

  late final deeplink = Provider(
    (ref) => DeeplinkManager(
      ref.watch(Di.repository.firebaseRemoteConfig),
    ),
  );

  late final streakProgress = Provider.autoDispose(
    (ref) => StreakProgressManager(
      ref.watch(Di.manager.user).currentUser!.uid,
      ref.watch(Di.repository.firebaseStreaksProgress),
    ),
  );

  late final linkHandler = Provider.autoDispose(
    (ref) => LinkHandlerManager(
      ref.watch(Di.manager.navigation),
    ),
  );

  late final premium = Provider.autoDispose((_) => PremiumManager());
}
