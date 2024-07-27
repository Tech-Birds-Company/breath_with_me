import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_download_indicator.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_tutor.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrackInfo extends StatelessWidget {
  final Track track;
  final Stream<bool> trackIsDownloadedStream;
  final Stream<bool> trackIsLikedStream;
  final VoidCallback onTrackLiked;

  const TrackInfo({
    required this.track,
    required this.trackIsDownloadedStream,
    required this.trackIsLikedStream,
    required this.onTrackLiked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final language = context.locale.languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                track.trackTranslatedTitle(language) ?? track.categoryKey.tr(),
                style: theme.typography.heading2.copyWith(
                  color: theme.primaryText,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                onPressed: onTrackLiked,
                constraints: BoxConstraints.tight(const Size(24, 24)),
                splashRadius: 24,
                padding: EdgeInsets.zero,
                icon: Align(
                  alignment: Alignment.topCenter,
                  child: StreamBuilder<bool>(
                    stream: trackIsLikedStream,
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
          LocaleKeys.trackDurationTitle.tr(
            namedArgs: {
              'duration': '${track.duration}',
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
              child: TrackTutor(
                key: ValueKey(track.tutor.id),
                tutorAvatarUrl: track.tutor.avatarUrl,
                tutorName: track.tutor.tutorTranslatedName(language) ??
                    track.tutor.tutorNameKey.tr(),
              ),
            ),
            Expanded(
              flex: 0,
              child: TrackDownloadIndicator(trackIsDownloadedStream),
            ),
          ],
        ),
      ],
    );
  }
}
