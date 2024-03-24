import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/profile_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userManager = ref.watch(Di.manager.user);
    final navigationManager = ref.watch(Di.manager.navigation);
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
              onTap: navigationManager.openProfile,
              size: 40,
              iconWidth: 18.56,
              iconHeight: 20.99,
            ),
          ],
        ).toSliver(),
        const SizedBox(height: 24).toSliver(),
        StreamBuilder(
          stream: userManager.userStream,
          initialData: userManager.currentUser,
          builder: (context, snapshot) {
            final user = snapshot.requireData;
            return _WelcomeTitle(username: user?.displayName ?? '');
          },
        ).toSliver(),
      ],
    );
  }
}

class _WelcomeTitle extends StatelessWidget {
  final String username;

  const _WelcomeTitle({required this.username});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.tracksTitle.tr(
            args: [username],
          ),
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
