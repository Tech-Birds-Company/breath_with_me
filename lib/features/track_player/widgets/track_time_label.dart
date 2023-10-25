import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/time_formatter.dart';
import 'package:flutter/material.dart';

class TrackTimeLabel extends StatelessWidget {
  final int? durationMs;
  final bool estimated;

  const TrackTimeLabel({
    this.durationMs,
    this.estimated = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Text(
      durationMs != null
          ? '${estimated ? '-' : ''}${TimeFormatter.formatMilliseconds(durationMs!)}'
          : '-:--',
      style: theme.typography.label.copyWith(color: theme.secondaryText),
    );
  }
}
