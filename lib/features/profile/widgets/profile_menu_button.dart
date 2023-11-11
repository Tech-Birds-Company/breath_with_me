import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuButton extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? icon;
  final bool showArrow;

  const ProfileMenuButton({
    this.title = '',
    this.subtitle,
    this.icon,
    this.showArrow = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        if (icon != null)
          Center(
            child: SvgPicture.asset(
              icon!,
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                theme.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        if (icon != null)
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
          ),
        Column(
          children: [
            Text(
              title,
              style: theme.typography.bodyM.copyWith(
                color: theme.fifthColor,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: theme.typography.footnote.copyWith(
                  color: theme.secondaryText,
                ),
              )
          ],
        ),
        const Spacer(),
        if (showArrow)
          Center(
            child: SvgPicture.asset(
              BWMAssets.menuArrow,
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                theme.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
      ],
    );
  }
}
