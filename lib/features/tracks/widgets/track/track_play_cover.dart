import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackPlayCover extends ConsumerWidget {
  final bool isTrackPremium;
  const TrackPlayCover({
    required this.isTrackPremium,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(36.5)),
      child: SizedBox(
        width: 73,
        height: 73,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.fifthColor.withOpacity(0.20),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(
                  -2,
                  4,
                ),
              ),
            ],
          ),
          child: Center(
            child: StreamBuilder<bool>(
              initialData: false,
              stream: ref.watch(Di.manager.premium).isPremiumUserStream,
              builder: (context, snapshot) {
                final isPremiumEnabled = snapshot.requireData;

                if (isTrackPremium && !isPremiumEnabled) {
                  return SvgPicture.asset(BWMAssets.lockFilledIcon);
                }

                return SvgPicture.asset(BWMAssets.playIcon);
              },
            ),
          ),
        ),
      ),
    );
  }
}
