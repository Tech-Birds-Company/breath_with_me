import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  SliverToBoxAdapter get toSliver => SliverToBoxAdapter(child: this);
}
