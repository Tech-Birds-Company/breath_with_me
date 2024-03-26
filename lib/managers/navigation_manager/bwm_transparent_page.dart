import 'package:flutter/material.dart';

class TransparentRoute<T> extends PageRoute<T> {
  final int duration;
  final WidgetBuilder builder;

  TransparentRoute({
    required this.builder,
    required RouteSettings settings,
    this.duration = 300,
  }) : super(settings: settings, fullscreenDialog: false);

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

final class TransparentPage<T> extends Page<T> {
  final Widget child;
  final int duration;

  const TransparentPage({
    required this.child,
    this.duration = 300,
  });

  @override
  Route<T> createRoute(BuildContext context) => TransparentRoute(
        duration: duration,
        builder: (context) => child,
        settings: this,
      );
}
