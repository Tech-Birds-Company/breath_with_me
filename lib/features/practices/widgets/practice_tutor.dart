import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PracticeTutor extends StatelessWidget {
  final String tutorAvatarUrl;
  final String tutorName;

  const PracticeTutor({
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
              child: FutureBuilder(
                key: ValueKey(tutorAvatarUrl),
                future: FirebaseStorage.instance
                    .refFromURL(tutorAvatarUrl)
                    .getDownloadURL(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CachedNetworkImage(
                      imageUrl: snapshot.requireData,
                    );
                  }
                  return const SizedBox();
                },
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
