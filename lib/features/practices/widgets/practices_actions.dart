import 'package:breath_with_me/assets.dart';
import 'package:breath_with_me/features/practices/widgets/practice_filter.dart';
import 'package:breath_with_me/i18n/locale_keys.g.dart';
import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PracticesActions extends StatelessWidget {
  const PracticesActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        PracticeFilter(
          filterTitle: LocaleKeys.practices_practice_category_all.tr(),
        ),
        const SizedBox(width: 8),
        PracticeFilter(
          filterTitle: LocaleKeys.practices_practice_language_ru.tr(),
        ),
        const Spacer(),
        SizedBox(
          width: 48,
          height: 36,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: theme.secondaryBackground,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image(
                image: const AssetImage(BWMAssets.heartIcon),
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
