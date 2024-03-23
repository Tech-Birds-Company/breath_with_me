import 'package:breathe_with_me/common/widgets/bottom_sheet_notch.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSheet extends ConsumerWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final navigationManager = ref.watch(Di.manager.navigation);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: ColoredBox(
        color: theme.primaryBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BottomSheetNotch(),
                _LanguageItem(
                  onPop: navigationManager.pop,
                  languageCode: 'en',
                ),
                Divider(
                  thickness: 1,
                  color: theme.secondaryBackground,
                ),
                _LanguageItem(
                  onPop: navigationManager.pop,
                  languageCode: 'ru',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final VoidCallback onPop;
  final String languageCode;

  const _LanguageItem({
    required this.onPop,
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
        onPop();
      },
    );
  }
}
