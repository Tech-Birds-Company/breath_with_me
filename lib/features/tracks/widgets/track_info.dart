import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/widgets/track_download_indicator.dart';
import 'package:breathe_with_me/features/tracks/widgets/track_tutor.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class TrackInfo extends ConsumerWidget {
  final Track _track;

  const TrackInfo(
    this._track, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.track(_track));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                _track.categoryKey.tr(),
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
                    stream: bloc.trackLikedStream,
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
              'duration': '${_track.duration}',
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
                key: ValueKey(_track.tutor.id),
                tutorAvatarUrl: _track.tutor.avatarUrl,
                tutorName: _track.tutor.tutorNameKey.tr(),
              ),
            ),
            Expanded(
              flex: 0,
              child: TrackDownloadIndicator(_track),
            ),
          ],
        ),
      ],
    );
  }
}
