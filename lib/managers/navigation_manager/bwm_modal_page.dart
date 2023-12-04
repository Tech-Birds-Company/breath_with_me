import 'package:flutter/material.dart';

final class BWMModalPage<T> extends Page<T> {
  final Widget child;
  final bool isScrollControlled;
  final Color? backgroundColor;
  final Color? barrierColor;
  final double? elevation;
  final bool useSafeArea;
  final bool enableDrag;

  const BWMModalPage({
    required this.child,
    this.isScrollControlled = false,
    this.backgroundColor,
    this.barrierColor,
    this.elevation,
    this.useSafeArea = false,
    this.enableDrag = true,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        builder: (context) => child,
        backgroundColor: backgroundColor,
        elevation: this.elevation,
        isScrollControlled: isScrollControlled,
        modalBarrierColor: barrierColor,
        useSafeArea: useSafeArea,
        enableDrag: enableDrag,
      );
}