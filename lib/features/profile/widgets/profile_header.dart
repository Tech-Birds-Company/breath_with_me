import 'package:breathe_with_me/common/widgets/profile_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/datetime_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final bool isUserPremium;
  final String? premiumEndDate;

  const ProfileHeader({
    required this.username,
    required this.isUserPremium,
    this.premiumEndDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)!.locale;
    final theme = Theme.of(context).extension<BWMTheme>()!;
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
                username,
                style: theme.typography.heading2.copyWith(
                  color: theme.primaryText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                isUserPremium
                    ? LocaleKeys.profilePremiumAccountType.tr()
                    : LocaleKeys.profileBaseAccountType.tr().toUpperCase(),
                style: isUserPremium
                    ? theme.typography.labelM.copyWith(
                        color: theme.purple2,
                      )
                    : theme.typography.label.copyWith(
                        color: theme.gray4,
                      ),
              ),
              if (premiumEndDate != null)
                Text(
                  LocaleKeys.profilePremiumExpires.tr(
                    args: [
                      DateTimeFormatter.convertDateToLocalizedText(
                        premiumEndDate!,
                        locale.languageCode,
                      ),
                    ],
                  ),
                  style: theme.typography.label.copyWith(
                    color: theme.gray6,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
