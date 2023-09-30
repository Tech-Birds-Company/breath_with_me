import 'package:breath_with_me/features/onboarding/widgets/create_account_button.dart';
import 'package:breath_with_me/features/onboarding/widgets/onboarding_header.dart';
import 'package:breath_with_me/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:breath_with_me/features/onboarding/widgets/onboarding_page_view.dart';
import 'package:breath_with_me/navigation/routes.dart';
import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 0,
              child: OnboardingHeader(),
            ),
            Expanded(
              child: OboardingPageView(
                pageController: _pageController,
              ),
            ),
            OnboardingIndicator(pageController: _pageController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 92),
              child: Align(
                alignment: Alignment.center,
                child: OnboardingCreateAccountButton(
                  onTap: () {
                    context.pushReplacement(BWMRoutes.home);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
