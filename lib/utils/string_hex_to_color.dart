import 'dart:ui';

extension StringHexToColor on String? {
  Color? toColor() {
    if (this == null) {
      return null;
    }
    final hexColor = this!.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}
