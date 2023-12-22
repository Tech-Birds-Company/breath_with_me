import 'package:breathe_with_me/theme/bwm_dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BWMApp extends StatelessWidget {
  final RouterConfig<Object>? routerConfig;

  const BWMApp({
    this.routerConfig,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: routerConfig,
        // TODO(vasidmi): Add dark theme
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
