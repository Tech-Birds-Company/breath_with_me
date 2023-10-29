import 'package:breathe_with_me/features/onboarding/widgets/sign_circle_button.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Center(
      child: Column(
        children: [
          Text(
            'Create account'.toUpperCase(),
            style: theme.typography.heading.copyWith(
              color: Colors.white,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignCircleButton(
                provider: SignCircleButtonProvider.apple,
                onPressed: () {
                  // Perform Apple sign up action
                },
              ),
              const SizedBox(width: 20),
              SignCircleButton(
                provider: SignCircleButtonProvider.google,
                onPressed: () {
                  // Perform Google sign up action
                },
              ),
              const SizedBox(width: 20),
              SignCircleButton(
                provider: SignCircleButtonProvider.email,
                onPressed: () {
                  // Perform Mail sign up action
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
