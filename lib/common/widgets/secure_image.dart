import 'package:breathe_with_me/di/di.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _secureImageUrlProvider = StreamProvider.family<String, String>(
  (ref, baseUrl) async* {
    final databaseManager = ref.read(Di.manager.database);

    final entity = await databaseManager.getSecureUrl(baseUrl);
    final dbUrl = entity?.secureUrl;
    if (dbUrl != null) {
      yield dbUrl;
    }

    final downloadUrlFuture = Future(
      FirebaseStorage.instance.refFromURL(baseUrl).getDownloadURL,
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw Exception('Timeout'),
    );

    try {
      final secureUrl = await downloadUrlFuture;
      yield secureUrl;
      await databaseManager.saveSecureUrl(baseUrl, secureUrl);
    } catch (_) {
      if (dbUrl != null) {
        yield dbUrl;
      }
    }
  },
);

class SecureCachedImage extends ConsumerWidget {
  final String baseUrl;
  final Widget loading;

  const SecureCachedImage({
    required this.baseUrl,
    required this.loading,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(_secureImageUrlProvider(baseUrl));

    return imageUrl.when(
      data: (url) => CachedNetworkImage(
        imageUrl: url,
        cacheKey: url,
      ),
      loading: () => loading,
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }
}
