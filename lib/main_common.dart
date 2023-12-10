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
import 'package:breathe_with_me/managers/remote_config_manager/remote_config_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager_dev.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager_prod.dart';
import 'package:breathe_with_me/managers/user_manager/firebase_user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/objectbox_bloc_storage.dart';
import 'package:breathe_with_me/utils/environment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<List<Override>> _setupDependencies({required bool isProduction}) async {
  final database = await BWMDatabase.init();
  final databaseManager = DatabaseManager(database);

  final storage = ObjectBoxBlocStateStorage(databaseManager.blocStateBox);
  CacheableBloc.storage = storage;

  final tracksDownloadManager = TracksDownloaderManager(databaseManager);
  final remoteConfigManager =
      RemoteConfigManager(FirebaseRemoteConfigRepository(databaseManager));
  final pushNotificationsManager = PushNotificationsManager();
  final userManager = FirebaseUserManager();
  final navigationManager = NavigationManager(userManager);
  final subscriptionsManager =
      isProduction ? SubscriptionsManagerProd() : SubscriptionsManagerDev();
  final playerManager = TrackPlayerManager();
  final trackAudioManager = await AudioService.init(
    builder: () => TrackAudioManager(playerManager),
    config: const AudioServiceConfig(
      androidNotificationChannelId: BWMConstants.androidNotificationChannelId,
      androidNotificationChannelName:
          BWMConstants.androidNotificationChannelName,
    ),
  );
  final sharedPrefsManager = SharedPreferencesManager();

  final appDocumentsDir = await getApplicationDocumentsDirectory();
  final playerIconFile = File(
    join(appDocumentsDir.path, BWMConstants.appIconFilename),
  );
  if (!playerIconFile.existsSync()) {
    final bytes = await rootBundle.load(BWMAssets.appIcon);
    await playerIconFile.create();
    await playerIconFile.writeAsBytes(bytes.buffer.asUint8List());
  }

  navigationManager.init();
  subscriptionsManager.init();
  remoteConfigManager.init();

  await sharedPrefsManager.init();
  await pushNotificationsManager.init();
  await tracksDownloadManager.validateDownloads();

  return [
    Di.shared.manager.database.overrideWith((ref) {
      ref.onDispose(databaseManager.dispose);
      return databaseManager;
    }),
    Di.shared.manager.tracksDownloader.overrideWithValue(tracksDownloadManager),
    Di.shared.manager.trackPlayer.overrideWithValue(playerManager),
    Di.shared.manager.audio.overrideWithValue(trackAudioManager),
    Di.shared.manager.remoteConfig.overrideWithValue(remoteConfigManager),
    Di.shared.manager.pushNotifications
        .overrideWithValue(pushNotificationsManager),
    Di.shared.manager.user.overrideWithValue(userManager),
    Di.shared.manager.navigation.overrideWithValue(navigationManager),
    Di.shared.manager.subscriptions.overrideWithValue(subscriptionsManager),
    Di.shared.manager.sharedPreferences.overrideWithValue(sharedPrefsManager),
  ];
}

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();

  final dependencies =
      await _setupDependencies(isProduction: env == Environment.prod);

  await EasyLocalization.ensureInitialized();

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
        overrides: dependencies,
        child: const BWMApp(),
      ),
    ),
  );
}