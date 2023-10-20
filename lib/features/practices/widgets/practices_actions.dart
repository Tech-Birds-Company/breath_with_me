import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_filter.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PracticesActions extends StatelessWidget {
  const PracticesActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        PracticeFilter(
          filterTitle: LocaleKeys.practiceCategoryAll.tr(),
        ),
        const SizedBox(width: 8),
        PracticeFilter(
          filterTitle: LocaleKeys.practiceLanguageRu.tr(),
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
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                BWMAssets.heartIcon,
                colorFilter: ColorFilter.mode(
                  theme.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
