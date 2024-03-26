import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LivesIndicator extends StatelessWidget {
  final int totalLives;
  final int configMaxLives;

  const LivesIndicator({
    required this.totalLives,
    required this.configMaxLives,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Wrap(
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
      );
}
