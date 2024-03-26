import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionLabel extends ConsumerWidget {
  AppVersionLabel({super.key});

  late final _versionProvider = FutureProvider.autoDispose(
    (_) => PackageInfo.fromPlatform(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ref.watch(_versionProvider).maybeWhen(
          data: (info) {
            final version = info.version;
            final build = info.buildNumber;
            return Text(
              'v$version ($build)',
              textAlign: TextAlign.center,
              style: theme.typography.label.copyWith(
                color: theme.secondaryText,
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
  }
}
