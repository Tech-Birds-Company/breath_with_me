import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_cover.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_info.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_play_button.dart';
import 'package:flutter/material.dart';

class PracticeItem extends StatelessWidget {
  final Track track;
  final VoidCallback onTap;

  const PracticeItem({
    required this.track,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
              flex: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PracticeCover(coverUrl: track.coverIcon,),
                  const PracticePlayButton(),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: PracticeInfo(
                trackId: track.id,
                title: track.title,
                duration: track.duration,
                tutor: track.tutor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
