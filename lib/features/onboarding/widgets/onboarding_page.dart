import 'package:breathe_with_me/features/onboarding/models/onboarding_info.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final PageController pageController;

  const OnboardingPage({
    required this.pageController,
    super.key,
  });

  static const _onboardingItems = [
    OnboardingInfo(
      title: LocaleKeys.onboardingPage1Title,
      subtitle: LocaleKeys.onboardingPage1Subtitle,
    ),
    OnboardingInfo(
      title: LocaleKeys.onboardingPage2Title,
      subtitle: LocaleKeys.onboardingPage2Subtitle,
    ),
    OnboardingInfo(
      title: LocaleKeys.onboardingPage3Title,
      subtitle: LocaleKeys.onboardingPage3Subtitle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return PageView.builder(
      itemCount: _onboardingItems.length,
      controller: pageController,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _onboardingItems[index].title.tr().toUpperCase(),
                textAlign: TextAlign.start,
                style: theme.typography.title.copyWith(
                  color: theme.primaryText,
                  letterSpacing: 0.9,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _onboardingItems[index].subtitle.tr(),
                style: theme.typography.subtitle.copyWith(
                  color: theme.fourthColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
