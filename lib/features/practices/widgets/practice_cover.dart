import 'dart:math';

import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';

class PracticeCover extends StatelessWidget {
  const PracticeCover({super.key});

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
