import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/practices/models/tutor.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_download_indicator.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_tutor.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PracticeInfo extends StatelessWidget {
  final String trackId;
  final String title;
  final int duration;
  final Tutor tutor;

  const PracticeInfo({
    required this.trackId,
    required this.title,
    required this.duration,
    required this.tutor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                title,
                style: theme.typography.heading2.copyWith(
                  color: theme.primaryText,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                constraints: BoxConstraints.tight(const Size(24, 24)),
                splashRadius: 24,
                padding: EdgeInsets.zero,
                icon: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(BWMAssets.heartIcon),
                ),
                onPressed: () {
                  // TODO(vasidmi): add favorite logic
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          LocaleKeys.practiceDurationTitle.tr(
            namedArgs: {
              'duration': '$duration',
            },
          ),
          style: theme.typography.bodyM.copyWith(
            color: theme.fourthColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: PracticeTutor(
                key: ValueKey(tutor.id),
                tutorAvatarUrl: tutor.avatarUrl,
                tutorName: tutor.tutorNameKey.tr(),
              ),
            ),
            Expanded(
              flex: 0,
              child: PracticeDownloadIndicator(
                trackId: trackId,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
