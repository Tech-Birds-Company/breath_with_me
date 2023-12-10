import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/practices/models/tutor.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_download_indicator.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_tutor.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PracticeInfo extends ConsumerWidget {
  final String trackId;
  final String category;
  final int duration;
  final Tutor tutor;

  const PracticeInfo({
    required this.trackId,
    required this.category,
    required this.duration,
    required this.tutor,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.practice(trackId));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                category,
                style: theme.typography.heading2.copyWith(
                  color: theme.primaryText,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                onPressed: bloc.onTrackLiked,
                constraints: BoxConstraints.tight(const Size(24, 24)),
                splashRadius: 24,
                padding: EdgeInsets.zero,
                icon: Align(
                  alignment: Alignment.topCenter,
                  child: StreamBuilder<bool>(
                    stream: bloc.trackLikedStream(trackId),
                    initialData: false,
                    builder: (context, snapshot) {
                      final isLiked = snapshot.requireData;
                      return SvgPicture.asset(
                        isLiked
                            ? BWMAssets.heartIconFilled
                            : BWMAssets.heartIcon,
                        colorFilter: ColorFilter.mode(
                          isLiked ? theme.secondaryColor : theme.fourthColor,
                          BlendMode.srcIn,
                        ),
                      );
                    },
                  ),
                ),
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
              child: PracticeDownloadIndicator(trackId: trackId),
            ),
          ],
        ),
      ],
    );
  }
}
