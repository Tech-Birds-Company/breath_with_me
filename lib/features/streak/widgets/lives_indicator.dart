import 'dart:ui';

import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LivesIndicator extends StatelessWidget {
  final int totalLives;
  final int configMaxLives;
  final bool isPremiumUser;

  const LivesIndicator({
    required this.totalLives,
    required this.configMaxLives,
    required this.isPremiumUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: isPremiumUser ? 0.0 : 13.0,
          sigmaY: isPremiumUser ? 0.0 : 13.0,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          children: [
            for (var i = 1; i <= configMaxLives; i++)
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    if (totalLives >= i)
                      const BoxShadow(
                        blurStyle: BlurStyle.inner,
                        color: Colors.white,
                        blurRadius: 10,
                      ),
                  ],
                ),
                child: SvgPicture.asset(
                  totalLives >= i
                      ? BWMAssets.streakLifeAvailable
                      : BWMAssets.streakLifeUnavailable,
                ),
              ),
          ],
        ),
      );
}
