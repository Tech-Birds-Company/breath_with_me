import 'package:breathe_with_me/common/widgets/profile_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final userManager = ref.watch(Di.manager.user);
    return StreamBuilder(
      stream: userManager.userStream,
      initialData: userManager.currentUser,
      builder: (context, snapshot) {
        final user = snapshot.data;
        return Row(
          children: [
            const ProfileButton(
              size: 64,
              iconWidth: 28,
              iconHeight: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.displayName ?? '',
                    style: theme.typography.heading2.copyWith(
                      color: theme.primaryText,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  StreamBuilder<bool>(
                    initialData: false,
                    stream: ref.watch(Di.manager.premium).isPremiumUserStream,
                    builder: (context, snapshot) {
                      final premiumEnabled = snapshot.requireData;
                      return Text(
                        premiumEnabled
                            ? LocaleKeys.profilePremiumAccountType
                                .tr()
                                .toUpperCase()
                            : LocaleKeys.profileBaseAccountType
                                .tr()
                                .toUpperCase(),
                        style: theme.typography.label.copyWith(
                          color: theme.gray4,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
