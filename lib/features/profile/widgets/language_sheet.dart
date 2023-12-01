import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: theme.primaryBackground,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    width: 44,
                    height: 4,
                    child: ColoredBox(
                      color: theme.secondaryBackground,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const _LanguageItem(languageCode: 'en'),
                Divider(
                  thickness: 1,
                  color: theme.secondaryBackground,
                ),
                const _LanguageItem(languageCode: 'ru'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String languageCode;

  const _LanguageItem({
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final localization = EasyLocalization.of(context)!;
    final locale = localization.locale;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        languageCode.tr(),
        style: theme.typography.bodyM.copyWith(
          color: theme.primaryColor,
        ),
      ),
      trailing: locale == Locale(languageCode)
          ? Icon(
              Icons.check_circle_rounded,
              color: theme.secondaryColor,
            )
          : null,
      onTap: () {
        localization.setLocale(Locale(languageCode));
        context.pop();
      },
    );
  }
}
