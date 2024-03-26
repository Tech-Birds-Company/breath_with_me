import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/onboarding/widgets/create_account_button.dart';
import 'package:breathe_with_me/features/onboarding/widgets/onboarding_header.dart';
import 'package:breathe_with_me/features/onboarding/widgets/onboarding_page_view.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.bloc.onboarding);
    useEffect(
      () {
        BWMAnalytics.logScreenView('OnboardingPage');
        return null;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: theme.darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 0,
              child: OnboardingHeader(),
            ),
            const Expanded(
              child: OnboardingPageView(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 92),
              child: Align(
                child: OnboardingCreateAccountButton(
                  onTap: bloc.onOpenCreateAccountModal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
