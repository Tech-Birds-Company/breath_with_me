import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/onboarding/widgets/create_account_button.dart';
import 'package:breathe_with_me/features/onboarding/widgets/onboarding_header.dart';
import 'package:breathe_with_me/features/onboarding/widgets/onboarding_page_view.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.onboarding);
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
