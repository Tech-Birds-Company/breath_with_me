import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _tutorAvatarProvider = FutureProvider.family<String, String>((ref, url) {
  return FirebaseStorage.instance.refFromURL(url).getDownloadURL();
});

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
    final avatar = ref.watch(_tutorAvatarProvider(tutorAvatarUrl));
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 28,
              height: 28,
              child: avatar.when(
                data: (url) => CachedNetworkImage(imageUrl: url),
                loading: () => const SizedBox.shrink(),
                error: (error, stackTrace) => const SizedBox.shrink(),
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
