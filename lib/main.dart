import 'package:breathe_with_me/app.dart';
import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/database/database.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/firebase_options.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<List<Override>> _setupDependencies() async {
  final database = await BWMDatabase.init();
  final databaseManager = DatabaseManager(database);

  return [
    Di.shared.manager.database.overrideWith((ref) {
      ref.onDispose(databaseManager.dispose);
      return databaseManager;
    }),
  ];
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: FutureBuilder<List<Override>>(
        future: _setupDependencies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProviderScope(
              overrides: snapshot.requireData,
              child: const BWMApp(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ),
  );
}
