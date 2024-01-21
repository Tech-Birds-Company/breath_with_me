import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/profile/blocs/profile_bloc.dart';
import 'package:breathe_with_me/features/profile/models/profile_state.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_header.dart';
import 'package:breathe_with_me/features/profile/widgets/profile_menu_button.dart';
import 'package:breathe_with_me/features/profile/widgets/reminder_profile_item.dart';
import 'package:breathe_with_me/features/reminder/blocs/reminder_bloc.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfilePage extends HookWidget {
  final ProfileBloc profileBloc;
  final ReminderBloc reminderBloc;

  const ProfilePage({
    required this.profileBloc,
    required this.reminderBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        profileBloc.updateStatistics();
        return null;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    final currentLocale = EasyLocalization.of(context)!.locale;

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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  ProfileHeader(
                    username: profileBloc.username,
                    premiumEnabled: profileBloc.premiumEnabled,
                    premiumEndDate: profileBloc.premiumEndDate,
                  ).toSliver(),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    bloc: profileBloc,
                    builder: (context, state) {
                      return state.statistics != null
                          ? StreakStatistics(data: state.statistics!)
                          : const SizedBox();
                    },
                  ).toSliver(),
                  const SizedBox(height: 96).toSliver(),
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
                    cachedBlocStateStream: reminderBloc.cachedBlocStateStream,
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
                    onTap: profileBloc.openCommunityChat,
                  ).toSliver(),
                  ProfileMenuItem(
                    title: LocaleKeys.profileContactUs.tr(),
                    icon: BWMAssets.email,
                    onTap: profileBloc.onSupportEmail,
                  ).toSliver(),
                  ProfileMenuItem(
                    title: LocaleKeys.profileLogout.tr(),
                    icon: BWMAssets.logout,
                    onTap: profileBloc.onSignOut,
                  ).toSliver(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
