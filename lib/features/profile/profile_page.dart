import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/app_version_label.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_header.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_menu_button.dart';
import 'package:breathe_with_me/features/profile/widgets/reminder_profile_item.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final currentLocale = EasyLocalization.of(context)!.locale;

    final profileBloc = ref.watch(Di.bloc.profile);
    final reminderBloc = ref.watch(Di.bloc.reminder);

    useEffect(
      () {
        BWMAnalytics.logScreenView('ProfilePage');
        return null;
      },
      const [],
    );

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
            child: CustomScrollView(
              slivers: [
                const BWMAppBar(
                  backgroundColor: Colors.transparent,
                ).toSliver(),
                const SizedBox(height: 32).toSliver(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverMainAxisGroup(
                    slivers: [
                      const ProfileHeader().toSliver(),
                      const SizedBox(height: 24).toSliver(),
                      const StreakStatisticsCard().toSliver(),
                      const SizedBox(height: 24).toSliver(),
                      ProfileMenuItem(
                        title: LocaleKeys.profileSettings.tr(),
                        onTap: profileBloc.openProfileSettings,
                        showIndicator: true,
                      ).toSliver(),
                      ProfileMenuItem(
                        title: LocaleKeys.profileLanguage.tr(),
                        subtitle: currentLocale.languageCode.tr(),
                        onTap: profileBloc.openLanguageSheet,
                        showIndicator: true,
                      ).toSliver(),
                      ReminderProfileItem(
                        cachedBlocStateStream:
                            reminderBloc.cachedBlocStateStream,
                        onOpenReminder: profileBloc.openReminder,
                      ).toSliver(),
                      ProfileMenuItem(
                        title: LocaleKeys.profileFAQ.tr(),
                        showIndicator: true,
                        onTap: profileBloc.openFaq,
                      ).toSliver(),
                      ProfileMenuItem(
                        title: LocaleKeys.profileChat.tr(),
                        icon: BWMAssets.telegram,
                        onTap: () =>
                            profileBloc.openCommunityChat(currentLocale),
                      ).toSliver(),
                      ProfileMenuItem(
                        title: LocaleKeys.profileContactUs.tr(),
                        icon: BWMAssets.email,
                        onTap: profileBloc.onSupportEmail,
                      ).toSliver(),
                      ProfileMenuItem(
                        title: LocaleKeys.profileLogout.tr(),
                        icon: BWMAssets.logout,
                        showDivider: false,
                        onTap: profileBloc.onSignOut,
                      ).toSliver(),
                      const SizedBox(height: 64).toSliver(),
                      AppVersionLabel().toSliver(),
                      const SizedBox(height: 16).toSliver(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
