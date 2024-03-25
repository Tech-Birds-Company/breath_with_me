import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final double iconWidth;
  final double iconHeight;

  const ProfileButton({
    required this.size,
    required this.iconWidth,
    required this.iconHeight,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: SizedBox(
          width: size,
          height: size,
          child: ColoredBox(
            color: theme.primaryColor,
            child: Center(
              child: SvgPicture.asset(
                BWMAssets.profileIcon,
                width: iconWidth,
                height: iconHeight,
                colorFilter: ColorFilter.mode(
                  theme.gray1,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
