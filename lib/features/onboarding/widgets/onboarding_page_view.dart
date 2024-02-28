import 'package:breathe_with_me/features/onboarding/models/onboarding_info.dart';
import 'package:breathe_with_me/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnboardingPageView extends StatefulHookWidget {
  const OnboardingPageView({super.key});

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
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late PageController _pageController;
  int? _prevPage;

  void _pageControllerListener() {
    final currentPage = _pageController.page?.toInt();
    if (_prevPage != currentPage) {
      _prevPage = currentPage;
      BWMAnalytics.event(
        'onboardingSwipePage',
        params: {
          'onboardingPage': currentPage.toString(),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _pageController = usePageController();
    useEffect(
      () {
        _pageController.addListener(_pageControllerListener);
        return null;
      },
      const [],
    );
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: OnboardingPageView._onboardingItems.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      OnboardingPageView._onboardingItems[index].title
                          .tr()
                          .toUpperCase(),
                      textAlign: TextAlign.start,
                      style: theme.typography.title.copyWith(
                        color: theme.primaryText,
                        letterSpacing: 0.9,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      OnboardingPageView._onboardingItems[index].subtitle.tr(),
                      style: theme.typography.subtitle.copyWith(
                        color: theme.fourthColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        OnboardingIndicator(
          pageController: _pageController,
          totalPages: OnboardingPageView._onboardingItems.length,
        ),
      ],
    );
  }
}
