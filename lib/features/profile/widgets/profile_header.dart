import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: SizedBox(
            width: 64,
            height: 64,
            child: ColoredBox(
              color: const Color(0xffbb6bd9), // TODO: Use color from theme
              child: Center(
                child: SvgPicture.asset(
                  BWMAssets.profileIcon,
                  fit: BoxFit.cover,
                  width: 27.84,
                  height: 31.49,
                  colorFilter: ColorFilter.mode(
                    theme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Julia',
              style: theme.typography.heading2.copyWith(
                color: theme.primaryText,
              ),
            ),
            Text(
              LocaleKeys.profilePremiumStatus.tr(),
              style: theme.typography.labelM.copyWith(
                color: const Color(0xffbb6bd9), // TODO: Use color from theme
              ),
            ),
            Text(
              'Until 1 Feb 2023',
              style: theme.typography.label.copyWith(
                color: theme.fourthColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
