import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LivesIndicator extends StatelessWidget {
  final int totalLives;
  final int configMaxLives;
  final DateTime? utcLivesExpireDateTime;
  final bool isPremiumEnabled;

  const LivesIndicator({
    required this.totalLives,
    required this.configMaxLives,
    required this.utcLivesExpireDateTime,
    required this.isPremiumEnabled,
    super.key,
  });

  String get _countdownText {
    final localDate = utcLivesExpireDateTime!.toLocal();
    final formattedDate =
        '${localDate.day.toString().padLeft(2, '0')}.${localDate.month.toString().padLeft(2, '0')}.${localDate.year}';
    return LocaleKeys.streakLivesWillResetTitle.tr(args: [formattedDate]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i <= configMaxLives; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      if (totalLives >= i)
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 12,
                        ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    totalLives >= i
                        ? BWMAssets.streakLifeAvailable
                        : BWMAssets.streakLifeUnavailable,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        if (isPremiumEnabled && utcLivesExpireDateTime != null)
          Text(
            _countdownText,
            style: theme.typography.label.copyWith(
              color: theme.secondaryText,
            ),
          ),
      ],
    );
  }
}
