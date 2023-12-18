import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_cover.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_info.dart';
import 'package:breathe_with_me/features/tracks/widgets/track/track_play_cover.dart';
import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  final Track track;
  final VoidCallback onTap;

  const TrackItem({
    required this.track,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TrackCover(
                    coverUrl: track.coverIcon,
                  ),
                  const TrackPlayCover(),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TrackInfo(track),
            ),
          ],
        ),
      );
}