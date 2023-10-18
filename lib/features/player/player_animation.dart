import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlayerAnimation extends StatelessWidget {
  final AnimationController controller;

  const PlayerAnimation({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Lottie.asset(
        BWMAssets.breathAnimation,
        controller: controller,
        onLoaded: (composition) {
          controller
            ..duration = composition.duration
            ..repeat();
        },
      ),
    );
  }
}
