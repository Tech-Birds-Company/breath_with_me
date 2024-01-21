import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_dark_theme.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BWMApp extends StatelessWidget {
  const BWMApp({super.key});

  @override
  Widget build(BuildContext context) => DependencyProvider(
        provider: Di.manager.navigation,
        builder: (context, dependency) => MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: dependency.router,
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
        ),
      );
}
