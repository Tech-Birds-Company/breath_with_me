import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_header.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: Stack(
        children: [
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  focal: Alignment(0, -0.3),
                  colors: [
                    Color(0xE6463050),
                    Color(0xD7000000),
                    Color(0xFC100c0c),
                  ],
                  radius: 3,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomScrollView(
                slivers: [
                  const ProfileHeader().toSliver,
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                  ).toSliver,
                  const Row(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 350.0,
                          height: 246.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xeb000000),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).toSliver,
                  Center(
                    child: Text(
                      'a month of free premium for every 3 friends',
                      style: theme.typography.label.copyWith(
                        color: theme.fourthColor,
                      ),
                    ),
                  ).toSliver,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
