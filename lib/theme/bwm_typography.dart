import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract interface class Typography {
  TextStyle get title;
  TextStyle get subtitle;
  TextStyle get heading;
  TextStyle get heading2;
  TextStyle get heading3;
  TextStyle get bodyM;
  TextStyle get bodyMTrue;
  TextStyle get label;
  TextStyle get labelM;
  TextStyle get footer;
  TextStyle get footnote;
}

final class BWMTypography extends Typography {
  static const _fontFamily = 'Oxygen';

  @override
  TextStyle get title => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 40 / 28,
      );

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
  TextStyle get heading3 => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        height: 24 / 20,
      );

  @override
  TextStyle get subtitle => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w300,
        fontSize: 18,
        height: 28 / 18,
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
  TextStyle get labelM => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 15.15 / 12,
      );

  @override
  TextStyle get bodyMTrue => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 20 / 16,
      );

  @override
  TextStyle get footer => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 18 / 14,
        );
      
  @override
  TextStyle get footnote => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: 16 / 12,
      );
}
