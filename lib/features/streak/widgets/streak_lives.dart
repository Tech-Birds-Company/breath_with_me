import 'package:flutter/material.dart';

class StreakLives extends StatelessWidget {
  const StreakLives({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();

    // final widgets = <Widget>[];
    //
    // if (data.showTitle) {
    //   widgets.addAll(
    //     [
    //       Text(
    //         LocaleKeys.streakLivesTitle.tr().toUpperCase(),
    //         style: theme.typography.label.copyWith(color: theme.gray3),
    //       ),
    //       const SizedBox(height: 8),
    //     ],
    //   );
    // }
    //
    // final unavailableLivesCount =
    //     data.totalLivesCount - data.availableLivesCount;
    // widgets.add(
    //   Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       for (var i = 0; i < data.availableLivesCount; i++) ...[
    //         SvgPicture.asset(
    //           BWMAssets.streakLifeAvailable,
    //           width: 26,
    //           height: 26,
    //         ),
    //         if ((i < data.availableLivesCount - 1) ||
    //             (unavailableLivesCount > 0))
    //           const SizedBox(width: 6),
    //       ],
    //       for (var i = 0; i < unavailableLivesCount; i++) ...[
    //         SvgPicture.asset(
    //           BWMAssets.streakLifeUnavailable,
    //           width: 26,
    //           height: 26,
    //         ),
    //         if (i < unavailableLivesCount - 1) const SizedBox(width: 6),
    //       ],
    //     ],
    //   ),
    // );
    //
    // if (data.showFooter) {
    //   widgets.addAll(
    //     [
    //       const SizedBox(height: 16),
    //       Text(
    //         LocaleKeys.streakLivesFooter
    //             .plural(data.totalLivesCount)
    //             .toUpperCase(),
    //         style: theme.typography.label.copyWith(color: theme.gray6),
    //       ),
    //     ],
    //   );
    // }
    //
    // return Column(children: widgets);
  }
}
