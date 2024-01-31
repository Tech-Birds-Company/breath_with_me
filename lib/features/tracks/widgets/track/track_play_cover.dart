import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrackPlayCover extends StatelessWidget {
  final bool isLocked;

  const TrackPlayCover({
    required this.isLocked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(36.5)),
      child: SizedBox(
        width: 73,
        height: 73,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.fifthColor.withOpacity(0.20),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(
                  -2,
                  4,
                ),
              ),
            ],
          ),
          child: Center(
            child: isLocked
                ? SvgPicture.asset(BWMAssets.lockFilledIcon)
                : SvgPicture.asset(BWMAssets.playIcon),
          ),
        ),
      ),
    );
  }
}
