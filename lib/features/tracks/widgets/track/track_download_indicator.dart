import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrackDownloadIndicator extends StatelessWidget {
  final Stream<bool> trackIsDownloadedStream;

  const TrackDownloadIndicator(
    this.trackIsDownloadedStream, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return StreamBuilder(
      stream: trackIsDownloadedStream,
      initialData: false,
      builder: (context, snapshot) {
        final downloaded = snapshot.requireData;
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: ColoredBox(
            color:
                downloaded ? theme.secondaryColor : theme.secondaryBackground,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: SvgPicture.asset(
                  BWMAssets.arrowDown,
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
