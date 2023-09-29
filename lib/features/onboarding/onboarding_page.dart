import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:breath_with_me/theme/bwm_typography.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      body: Center(
        child: Text(
          'Onboarding',
          style: BWMThemeTypography(theme).heading2,
        ),
      ),
    );
  }
}
