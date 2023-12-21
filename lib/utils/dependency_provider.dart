import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DependencyProvider<T> extends StatelessWidget {
  final ProviderListenable<T> provider;
  final Widget Function(BuildContext context, T dependency) builder;

  const DependencyProvider({
    required this.provider,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final diContainer = ProviderScope.containerOf(context);
    final dependency = diContainer.read(provider);

    return builder(context, dependency);
  }
}