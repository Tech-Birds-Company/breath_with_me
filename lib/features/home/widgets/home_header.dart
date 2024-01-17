import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/home/widgets/profile_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onProfileTap;

  const HomeHeader({
    required this.onProfileTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        Row(
          children: [
            SvgPicture.asset(
              BWMAssets.logoIcon,
              width: 111,
            ),
            const Spacer(),
            ProfileButton(
              onTap: onProfileTap,
            ),
          ],
        ).toSliver(),
        const SizedBox(height: 24).toSliver(),
        const _WelcomeTitle().toSliver(),
      ],
    );
  }
}

class _WelcomeTitle extends StatelessWidget {
  const _WelcomeTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.tracksGuestWelcome.tr(),
          style: theme.typography.bodyM.copyWith(
            color: theme.primaryText,
          ),
        ),
        Text(
          LocaleKeys.tracksHeading.tr(),
          style: theme.typography.heading.copyWith(
            color: theme.primaryText,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}
