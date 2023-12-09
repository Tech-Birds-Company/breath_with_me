import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SafetyPrecautionsPage extends HookConsumerWidget {
  const SafetyPrecautionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final sharedPreferencesManager =
        ref.read(Di.shared.manager.sharedPreferences);

    useEffect(
      () {
        return sharedPreferencesManager.setSafetyPrecautionsShowed;
      },
      const [],
    );

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: Stack(
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
              onPressed: context.pop,
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
                  'Привет,\nМы рады тебя видеть!',
                  textAlign: TextAlign.center,
                  style: theme.typography.heading2.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Прежде чем продолжить, ознакомься с техникой безопасности и рекомендациями по дыханию',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyM.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                const Spacer(),
                BWMActionButton(
                  title: 'Читать сейчас',
                  width: 155,
                  height: 36,
                  onPressed: () {
                    context
                      ..pop()
                      ..push('/faq');
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
