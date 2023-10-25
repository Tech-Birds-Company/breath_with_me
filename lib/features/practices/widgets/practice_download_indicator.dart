import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PracticeDownloadIndicator extends ConsumerWidget {
  final String trackId;

  const PracticeDownloadIndicator({
    required this.trackId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.practiceList);
    return StreamBuilder<bool>(
      stream: bloc.trackIsDownloadedStream(trackId),
      initialData: false,
      builder: (context, snapshot) {
        final downloaded = snapshot.requireData;
        return ClipOval(
          child: ColoredBox(
            color:
                downloaded ? theme.secondaryColor : theme.secondaryBackground,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Center(
                child: SvgPicture.asset(
                  BWMAssets.arrowDown,
                  width: 14,
                  height: 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
