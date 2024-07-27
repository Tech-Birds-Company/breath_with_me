import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StreakWithoutPremium extends ConsumerWidget {
  final int streaksCount;
  final VoidCallback onReminderTap;
  final String? artist;
  final String? trackName;

  const StreakWithoutPremium({
    required this.streaksCount,
    required this.onReminderTap,
    this.artist,
    this.trackName,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.streak);
    final languageCode = EasyLocalization.of(context)!.locale.languageCode;
    final widgets = [
      const SizedBox(height: 32),
      const StreakStatisticsCard(),
      StreakWeeks(selectedDay: streaksCount),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          LocaleKeys.reminderTitle.tr(),
          style: theme.typography.bodyM.copyWith(
            color: theme.gray6,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: theme.gray6,
          size: 16,
        ),
        onTap: onReminderTap,
      ),
      FutureBuilder<StreakQuoteData?>(
        future: bloc.getQuote(languageCode),
        builder: (context, snapshot) {
          final quote = snapshot.data;
          return quote == null
              ? const SizedBox.shrink()
              : StreakQuote(data: quote);
        },
      ),
      if (artist != null && trackName != null)
        Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      artist!,
                      style: theme.typography.bodyMTrue.copyWith(
                        color: theme.primaryText,
                      ),
                    ),
                    Text(
                      trackName!,
                      style: theme.typography.bodyS.copyWith(
                        color: theme.gray6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    ];
    return ListView.separated(
      itemCount: widgets.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => widgets[index],
    );
  }
}
