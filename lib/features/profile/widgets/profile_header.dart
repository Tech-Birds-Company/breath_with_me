import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/datetime_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final bool premiumEnabled;
  final String? premiumEndDate;

  const ProfileHeader({
    required this.username,
    required this.premiumEnabled,
    this.premiumEndDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)!.locale;
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: SizedBox(
            width: 64,
            height: 64,
            child: ColoredBox(
              color: premiumEnabled ? theme.purple2 : theme.gray6,
              child: Center(
                child: SvgPicture.asset(
                  BWMAssets.profileIcon,
                  fit: BoxFit.cover,
                  width: 27.84,
                  height: 31.49,
                  colorFilter: ColorFilter.mode(
                    premiumEnabled ? theme.primaryColor : theme.gray1,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
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
                (premiumEnabled
                        ? LocaleKeys.profilePremiumAccountType.tr()
                        : LocaleKeys.profileBaseAccountType.tr())
                    .toUpperCase(),
                style: premiumEnabled
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
