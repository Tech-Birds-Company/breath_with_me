import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BWMApp extends ConsumerWidget {
  const BWMApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationManager = ref.read(Di.shared.manager.navigation);

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: navigationManager.router,
      // TODO(vasidmi): Add dark theme
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
