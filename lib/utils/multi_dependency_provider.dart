import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiDependecyProvider2<T1, T2> extends StatelessWidget {
  final (ProviderListenable<T1>, ProviderListenable<T2>) providers;
  final Widget Function(BuildContext context, (T1, T2) dependencies) builder;

  const MultiDependecyProvider2({
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
