import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class BaseTypography {
  TextStyle get heading;
  TextStyle get heading2;
  TextStyle get bodyM;
  TextStyle get bodyMTrue;
  TextStyle get label;
}

class BWMTypography extends BaseTypography {
  static const _fontFamily = 'Oxygen';

  @override
  TextStyle get heading => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        height: 28 / 24,
      );

  @override
  TextStyle get heading2 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 28 / 24,
      );

  @override
  TextStyle get bodyM => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 20 / 16,
      );

  @override
  TextStyle get label => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 16 / 12,
      );

  @override
  TextStyle get bodyMTrue => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 20 / 16,
      );
}
