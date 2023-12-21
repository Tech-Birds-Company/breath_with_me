import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _secureImageUrlProvider = FutureProvider.family<String?, String>(
  (ref, baseUrl) async {
    final databaseManager = ref.read(Di.shared.manager.database);
    final downloadUrlFuture = Future(
      () async {
        final secureUrl =
            await FirebaseStorage.instance.refFromURL(baseUrl).getDownloadURL();
        return secureUrl;
      },
    ).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        throw Exception('Timeout');
      },
    );
    try {
      final secureUrl = await downloadUrlFuture;
      await databaseManager.saveSecureUrl(baseUrl, secureUrl);
      return secureUrl;
    } on Exception {
      final entity = await databaseManager.getSecureUrl(baseUrl);
      return entity?.secureUrl;
    }
  },
);

class SecureCachedImage extends StatelessWidget {
  final String baseUrl;
  final Widget loading;

  const SecureCachedImage({
    required this.baseUrl,
    required this.loading,
    super.key,
  });

  @override
  Widget build(BuildContext context) => DependecyProvider(
        provider: _secureImageUrlProvider(baseUrl),
        builder: (context, dependency) => dependency.when(
          data: (url) => url != null
              ? CachedNetworkImage(imageUrl: url)
              : const SizedBox.shrink(),
          loading: () => loading,
          error: (error, stackTrace) => const SizedBox.shrink(),
        ),
      );
}
