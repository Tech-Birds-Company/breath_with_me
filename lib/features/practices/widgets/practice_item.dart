import 'dart:math';

import 'package:breath_with_me/assets.dart';
import 'package:breath_with_me/features/practices/widgets/practice_tutor.dart';
import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class PracticeItem extends StatelessWidget {
  const PracticeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              _PracticeCover(),
              _PracticePlayButton(),
            ],
          ),
          SizedBox(width: 20),
          _PracticeInfo(),
          Spacer(),
          Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage(BWMAssets.heartIcon),
            ),
          ),
        ],
      ),
    );
  }
}

class _PracticeCover extends StatelessWidget {
  const _PracticeCover();

  static const _covers = [
    BWMAssets.blueCover,
    BWMAssets.emeraldCover,
    BWMAssets.purpleCover,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image(
        image: AssetImage(
          _covers[Random().nextInt(
            max(
              0,
              _covers.length,
            ),
          )],
        ),
      ),
    );
  }
}

class _PracticePlayButton extends StatelessWidget {
  const _PracticePlayButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipOval(
      child: SizedBox(
        width: 73,
        height: 73,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.fifthColor.withOpacity(0.20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(
                  -2,
                  4,
                ),
              )
            ],
          ),
          child: const Image(
            image: AssetImage(BWMAssets.playIcon),
          ),
        ),
      ),
    );
  }
}

class _PracticeInfo extends StatelessWidget {
  const _PracticeInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Energize',
          style: theme.typography.heading2.copyWith(
            color: theme.primaryText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '6 min',
          style: theme.typography.bodyM.copyWith(
            color: theme.fourthColor,
          ),
        ),
        const SizedBox(height: 12),
        const PracticeTutor(
          tutorAvatarUrl: BWMAssets.dashaIcon,
          tutorName: 'Dasha',
        ),
      ],
    );
  }
}
