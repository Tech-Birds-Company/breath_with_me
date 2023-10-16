import 'dart:ui';

import 'package:breathe_with_me/features/onboarding/onboarding_info_pages.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final PageController pageController;

  const OnboardingIndicator({required this.pageController, super.key});

  double _indicatorInterpolator({
    required double from,
    required double to,
    required int index,
  }) {
    final page = pageController.page ?? 0;
    return lerpDouble(
      from,
      to,
      (1.0 - ((page - index).abs().clamp(0.0, 1.0))),
    )!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...onboardingInfoModels.mapIndexed(
              (index, _) {
                final width = _indicatorInterpolator(
                  from: 8,
                  to: 48,
                  index: index,
                );
                final opacity = _indicatorInterpolator(
                  from: 0.2,
                  to: 1,
                  index: index,
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      width: width,
                      height: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: theme.fifthColor.withOpacity(
                            opacity,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
