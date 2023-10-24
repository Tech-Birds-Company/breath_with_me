import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/track_player/widgets/play_button.dart';
import 'package:breathe_with_me/features/track_player/widgets/track_progress_indicator.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackPlayerPage extends HookConsumerWidget {
  final String trackId;

  const TrackPlayerPage({
    required this.trackId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.trackPlayer(trackId));

    useEffect(
      () {
        bloc.init();
        return bloc.dispose;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryBackground,
      ),
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: TrackPlayButton(trackId: trackId),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TrackProgressIndicator(trackId: trackId),
            ),
          ],
        ),
      ),
    );
  }
}
