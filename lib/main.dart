import 'package:breathe_with_me/firebase_options.dart';
import 'package:breathe_with_me/navigation/router.dart';
import 'package:breathe_with_me/theme/bwm_light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'assets.dart';

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: BWMRouter.router,
      // TODO: Add dark theme
      darkTheme: ThemeData.light().copyWith(
        extensions: [
          const BWMLightTheme(),
        ],
      ),
      theme: ThemeData.light().copyWith(
        extensions: [
          const BWMLightTheme(),
        ],
      ),
    );
  }
}
