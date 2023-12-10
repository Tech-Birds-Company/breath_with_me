import 'package:breathe_with_me/common/widgets/secure_image.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PracticeTutor extends ConsumerWidget {
  final String tutorAvatarUrl;
  final String tutorName;

  const PracticeTutor({
    required this.tutorAvatarUrl,
    required this.tutorName,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 28,
              height: 28,
              child: SecureCachedImage(
                baseUrl: tutorAvatarUrl,
                loading: ColoredBox(color: theme.secondaryBackground),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            tutorName.toUpperCase(),
            style: theme.typography.bodyMTrue.copyWith(
              color: theme.primaryText,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
