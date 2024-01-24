import 'package:breathe_with_me/theme/bwm_dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BWMApp extends StatelessWidget {
  final GoRouter _router;

  const BWMApp(
    this._router, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: _router,
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
