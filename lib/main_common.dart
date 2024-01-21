import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:breathe_with_me/app.dart';
import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/database/database.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/managers/audio_manager/track_audio_manger.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/download_manager/tracks_downloader_manger.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/player_manager/track_player_manager.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/bwm_subscriptions_manager.dart';
import 'package:breathe_with_me/managers/user_manager/firebase_user_manager.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/isar_bloc_storage.dart';
import 'package:breathe_with_me/utils/environment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<ProviderContainer> _setupDependencies({
  required bool isProduction,
}) async {
  final database = BWMDatabase();
  await database.init();
  final databaseManager = DatabaseManager(database);

  final storage = IsarBlocStateStorage(databaseManager);
  CacheableBloc.storage = storage;

  final tracksDownloadManager = TracksDownloaderManager(databaseManager);

  final subscriptionsManager = BWMSubscriptionsManager(
    isProduction
        ? BWMConstants.revenueCatApiKeyProd
        : BWMConstants.revenueCatApiKeyDev,
  );
  await subscriptionsManager.configure();

  final userManager = FirebaseUserManager(subscriptionsManager);

  final sharedPrefsManager = SharedPreferencesManager();

  final pushNotificationsManager = PushNotificationsManager();

  final appDocumentsDir = await getApplicationDocumentsDirectory();
  final playerIconFile = File(
    join(appDocumentsDir.path, BWMConstants.appIconFilename),
  );
  if (!playerIconFile.existsSync()) {
    final bytes = await rootBundle.load(BWMAssets.appIcon);
    await playerIconFile.create();
    await playerIconFile.writeAsBytes(bytes.buffer.asUint8List());
  }

  final navigationManager = NavigationManager(userManager)..init();

  final trackAudioManager = await AudioService.init(
    builder: () => TrackAudioManager(
      TrackPlayerManager(
        subscriptionsManager,
        navigationManager,
      ),
    ),
    config: const AudioServiceConfig(
      androidNotificationChannelId: BWMConstants.androidNotificationChannelId,
      androidNotificationChannelName:
          BWMConstants.androidNotificationChannelName,
    ),
  );

  final uid = userManager.currentUser?.uid;
  if (uid != null) {
    await tracksDownloadManager.validateDownloads(uid);
  }

  await sharedPrefsManager.init();
  await pushNotificationsManager.init();

  final dependencies = [
    Di.manager.database.overrideWith((ref) {
      ref.onDispose(databaseManager.dispose);
      return databaseManager;
    }),
    Di.manager.subscriptions.overrideWith((ref) {
      ref.onDispose(subscriptionsManager.dispose);
      return subscriptionsManager;
    }),
    Di.manager.audio.overrideWithValue(trackAudioManager),
    Di.manager.sharedPreferences.overrideWithValue(sharedPrefsManager),
    Di.manager.pushNotifications.overrideWithValue(pushNotificationsManager),
    Di.manager.navigation.overrideWithValue(navigationManager),
  ];

  return ProviderContainer(overrides: dependencies);
}

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  await FirebaseRemoteConfig.instance.ensureInitialized();
  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(minutes: 12),
    ),
  );
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  final diContainer =
      await _setupDependencies(isProduction: env == Environment.prod);

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      path: BWMAssets.i18n,
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      child: ProviderScope(
        parent: diContainer,
        child: const BWMApp(),
      ),
    ),
  );
}
