import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BWMApp extends ConsumerWidget {
  const BWMApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationManager = ref.watch(Di.manager.navigation);
    final router = navigationManager.router;
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
      darkTheme: ThemeData.dark(useMaterial3: false).copyWith(
        extensions: [
          const BWMDarkTheme(),
        ],
      ),
      theme: ThemeData.light(useMaterial3: false).copyWith(
        extensions: [
          const BWMDarkTheme(),
        ],
      ),
    );
  }
}
