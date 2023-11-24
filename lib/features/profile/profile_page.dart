import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_header.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_info_block.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_menu_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: Stack(
        children: [
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  focal: Alignment(0, -0.3),
                  colors: [
                    Color(0xE6463050), // TODO: Use color from theme
                    Color(0xD7000000), // TODO: Use color from theme
                    Color(0xFC100c0c), // TODO: Use color from theme
                  ],
                  radius: 3,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomScrollView(
                slivers: [
                  const ProfileHeader().toSliver,
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 32, 20, 0),
                    child: ProfileInfoBlock(),
                  ).toSliver,
                  Center(
                    child: Text(
                      LocaleKeys.profilePremiumFor3Friends.tr(),
                      style: theme.typography.label.copyWith(
                        color: theme.fourthColor,
                      ),
                    ),
                  ).toSliver,
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 36, 0, 0),
                  ).toSliver,
                  ProfileMenuButton(
                    title: LocaleKeys.profileSettings.tr(),
                    showArrow: true,
                  ).toSliver,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0x995D5D6D), // TODO: Use color from theme
                    ),
                  ).toSliver,
                  ProfileMenuButton(
                    title: LocaleKeys.profileLanguage.tr(),
                    subtitle: LocaleKeys.profileLanguageEn.tr(),
                    showArrow: true,
                  ).toSliver,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0x995D5D6D), // TODO: Use color from theme
                    ),
                  ).toSliver,
                  ProfileMenuButton(
                    title: LocaleKeys.profileReminder.tr(),
                    subtitle: '10:00 AM; Tue, Thu, Sat',
                    showArrow: true,
                  ).toSliver,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0x995D5D6D), // TODO: Use color from theme
                    ),
                  ).toSliver,
                  ProfileMenuButton(
                    title: LocaleKeys.profileFAQ.tr(),
                    showArrow: true,
                  ).toSliver,
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 89),
                  ).toSliver,
                  ProfileMenuButton(
                    title: LocaleKeys.profileChat.tr(),
                    icon: BWMAssets.telegram,
                  ).toSliver,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0x995D5D6D), // TODO: Use color from theme
                    ),
                  ).toSliver,
                  ProfileMenuButton(
                    title: LocaleKeys.profileContactUs.tr(),
                    icon: BWMAssets.email,
                  ).toSliver,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
