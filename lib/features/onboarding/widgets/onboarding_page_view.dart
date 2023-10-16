import 'package:breathe_with_me/features/onboarding/onboarding_info_pages.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OboardingPageView extends StatelessWidget {
  final PageController pageController;
  OboardingPageView({
    required this.pageController,
    super.key,
  });

  late final _linearGradient = LinearGradient(
    colors: <Color>[
      const Color(0xFFFFFFFF).withOpacity(1),
      const Color(0xFFFFFFFF).withOpacity(0.8479),
      const Color(0xFFFFFFFF).withOpacity(0.3),
    ],
  ).createShader(
    const Rect.fromLTWH(
      0.0,
      0.0,
      200.0,
      70.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return PageView.builder(
      itemCount: onboardingInfoModels.length,
      controller: pageController,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                onboardingInfoModels[index].title.tr().toUpperCase(),
                textAlign: TextAlign.start,
                style: theme.typography.title.copyWith(
                  foreground: Paint()..shader = _linearGradient,
                  letterSpacing: 0.9,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                onboardingInfoModels[index].subtitle.tr(),
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
