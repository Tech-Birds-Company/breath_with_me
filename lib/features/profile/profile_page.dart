import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_header.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_info_block.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_menu_button.dart';
import 'package:breathe_with_me/features/profile/widgets/reminder_profile_item.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final currentLocale = EasyLocalization.of(context)!.locale;
    final bloc = ref.read(Di.shared.bloc.profile);
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
                    subtitle: currentLocale.languageCode.tr(),
                    showArrow: true,
                    onTap: bloc.openLanguageSheet,
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
                  const ReminderProfileItem().toSliver,
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
                    onTap: bloc.openCommunityChat,
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
                    onTap: bloc.onSupportEmail,
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
                    title: LocaleKeys.profileLogout.tr(),
                    icon: BWMAssets.logout,
                    onTap: bloc.onSignOut,
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
