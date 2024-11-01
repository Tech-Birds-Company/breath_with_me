import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SafetyPrecautionsPage extends HookConsumerWidget {
  const SafetyPrecautionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.safetyPrecautions);

    useEffect(
      () {
        BWMAnalytics.logScreenView('SafetyPrecautionsPage');
        return bloc.setSafetyPrecautionsShowed;
      },
      const [],
    );

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    theme.primaryBackground,
                    const Color(0xE6463050), // TODO: Use color from theme
                    const Color(0xE6463050), // TODO: Use color from theme
                    const Color(0xD7000000), // TODO: Use color from theme
                    const Color(0xD7000000), // TODO: Use color from theme
                  ],
                  center: const Alignment(0, 0.7),
                  radius: 10,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: bloc.onCloseScreen,
              icon: Icon(
                Icons.close,
                color: theme.primaryColor,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.5),
            child: Column(
              children: [
                const SizedBox(height: 140),
                Text(
                  LocaleKeys.safetyPrecautionsWelcomeTitle.tr(),
                  textAlign: TextAlign.center,
                  style: theme.typography.heading2.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  LocaleKeys.safetyPrecautionsWelcomeDescription.tr(),
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyM.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 28),
                BWMActionButton(
                  title: LocaleKeys.safetyPrecautionsReadNow.tr(),
                  width: 155,
                  height: 40,
                  onPressed: bloc.openFaq,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
