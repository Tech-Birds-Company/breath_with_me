import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiDependencyProvider2<T1, T2> extends StatelessWidget {
  final (
    ProviderListenable<T1>,
    ProviderListenable<T2>,
  ) providers;
  final Widget Function(BuildContext context, (T1, T2) dependencies) builder;

  const MultiDependencyProvider2({
    required this.providers,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final diContainer = ProviderScope.containerOf(context);

    return builder(
      context,
      (
        diContainer.read(providers.$1),
        diContainer.read(providers.$2),
      ),
    );
  }
}

class MultiDependencyProvider3<T1, T2, T3> extends StatelessWidget {
  final (
    ProviderListenable<T1>,
    ProviderListenable<T2>,
    ProviderListenable<T3>,
  ) providers;
  final Widget Function(BuildContext context, (T1, T2, T3) dependencies)
      builder;

  const MultiDependencyProvider3({
    required this.providers,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final diContainer = ProviderScope.containerOf(context);

    return builder(
      context,
      (
        diContainer.read(providers.$1),
        diContainer.read(providers.$2),
        diContainer.read(providers.$3),
      ),
    );
  }
}

class MultiDependencyProvider4<T1, T2, T3, T4> extends StatelessWidget {
  final (
    ProviderListenable<T1>,
    ProviderListenable<T2>,
    ProviderListenable<T3>,
    ProviderListenable<T4>,
  ) providers;
  final Widget Function(BuildContext context, (T1, T2, T3, T4) dependencies)
      builder;

  const MultiDependencyProvider4({
    required this.providers,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final diContainer = ProviderScope.containerOf(context);

    return builder(
      context,
      (
        diContainer.read(providers.$1),
        diContainer.read(providers.$2),
        diContainer.read(providers.$3),
        diContainer.read(providers.$4),
      ),
    );
  }
}
