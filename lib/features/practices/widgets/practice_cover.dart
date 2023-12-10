import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _coverIconDownloadUrl = FutureProvider.family<String, String>(
  (ref, url) {
    return FirebaseStorage.instance.refFromURL(url).getDownloadURL();
  },
);

class PracticeCover extends ConsumerWidget {
  final String coverUrl;

  const PracticeCover({
    required this.coverUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cover = ref.watch(_coverIconDownloadUrl(coverUrl));
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 103,
        height: 103,
        child: cover.maybeWhen(
          data: (url) {
            return CachedNetworkImage(imageUrl: url);
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
