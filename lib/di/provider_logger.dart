import 'package:breathe_with_me/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class ProviderLogger extends ProviderObserver {
  late final _providers = <int, ProviderBase<Object?>>{};

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.i(
      '[RIVERPOD]: didAddProvider: ${provider.name ?? provider.runtimeType}',
      stackTrace: StackTrace.empty,
    );
    _providers[provider.hashCode] = provider;
    logger.i('[RIVERPOD]: ${_providers.length} providers alive');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.w(
      '[RIVERPOD] didDisposeProvider: ${provider.name ?? provider.runtimeType}',
      stackTrace: StackTrace.empty,
    );
    _providers.remove(provider.hashCode);
    logger.i('[RIVERPOD]: ${_providers.length} providers alive');
  }
}
