import 'package:breath_with_me/assets.dart';
import 'package:breath_with_me/extensions/widget.dart';
import 'package:breath_with_me/features/home/widgets/profile_button.dart';
import 'package:breath_with_me/i18n/locale_keys.g.dart';
import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverMainAxisGroup(
        slivers: [
          Row(
            children: [
              SvgPicture.asset(BWMAssets.logoIcon),
              const Spacer(),
              const ProfileButton(),
            ],
          ).toSliver,
          const SizedBox(height: 24).toSliver,
          const _WelcomeTitle().toSliver
        ],
      ),
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
          LocaleKeys.practicesGuestWelcome.tr(),
          style: theme.typography.bodyM.copyWith(
            color: theme.primaryText,
          ),
        ),
        Text(
          LocaleKeys.practicesHeading.tr(),
          style: theme.typography.heading.copyWith(
            color: theme.primaryText,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}
