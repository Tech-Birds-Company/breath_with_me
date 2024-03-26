import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/datetime_formatter.dart';
import 'package:flutter/material.dart';

class TrackTimeLabel extends StatelessWidget {
  final int durationMs;
  final bool estimated;

  const TrackTimeLabel({
    this.durationMs = 0,
    this.estimated = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Text(
      durationMs > 0
          ? '${estimated ? '-' : ''}${DateTimeFormatter.formatMilliseconds(durationMs)}'
          : '-:--',
      style: theme.typography.label.copyWith(color: theme.secondaryText),
    );
  }
}
