import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StreakLives extends StatelessWidget {
  final StreakLivesData data;

  const StreakLives({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    var widgets = <Widget>[];

    if (data.showTitle) {
      widgets.add(
        Text(
          LocaleKeys.streakLivesTitle.tr().toUpperCase(),
          style: theme.typography.label.copyWith(color: theme.gray3),
        ),
      );
    }

    widgets.add(
      Row(
        children: [
          SvgPicture.asset(
            BWMAssets.streakLiveAvailable,
            width: 26,
            height: 26,
          ),
          SvgPicture.asset(
            BWMAssets.streakLiveUnavailable,
            width: 26,
            height: 26,
          ),
        ],
      ),
    );

    if (data.showFooter) {
      widgets.add(
        Text(
          LocaleKeys.streakLivesFooter.plural(data.totalLivesCount).tr().toUpperCase(),
          style: theme.typography.bodyM.copyWith(color: theme.gray6),
        ),
      );
    }

    return Column(children: widgets);
  }
}
