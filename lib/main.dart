import 'package:breathe_with_me/app.dart';
import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/database/database.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/firebase_options.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/download_manager/tracks_downloader_manger.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<List<Override>> _setupDependencies() async {
  final database = await BWMDatabase.init();
  final databaseManager = DatabaseManager(database);
  final tracksDownloadManager = TracksDownloaderManager(databaseManager);

  await tracksDownloadManager.validateDownloads();

  final storage = ObjectBoxBlocStateStorage(databaseManager.blocStateBox);
  CacheableBloc.storage = storage;

  return [
    Di.shared.manager.database.overrideWith((ref) {
      ref.onDispose(databaseManager.dispose);
      return databaseManager;
    }),
    Di.shared.manager.tracksDownloader.overrideWithValue(tracksDownloadManager),
  ];
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dependencies = await _setupDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
