import 'package:breathe_with_me/common/widgets/secure_image.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PracticeCover extends ConsumerWidget {
  final String coverUrl;

  const PracticeCover({
    required this.coverUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 103,
        height: 103,
        child: SecureCachedImage(
          baseUrl: coverUrl,
          loading: ColoredBox(color: theme.secondaryBackground),
        ),
      ),
    );
  }
}
