import 'package:breathe_with_me/common/widgets/secure_image.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class TrackTutor extends StatelessWidget {
  final String tutorAvatarUrl;
  final String tutorName;

  const TrackTutor({
    required this.tutorAvatarUrl,
    required this.tutorName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
