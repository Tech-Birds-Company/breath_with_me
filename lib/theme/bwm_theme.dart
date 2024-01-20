import 'package:breathe_with_me/theme/bwm_typography.dart';
import 'package:flutter/material.dart';

class BWMTheme extends ThemeExtension<BWMTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color fourthColor;
  final Color fifthColor;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color darkBackground;
  final Color primaryText;
  final Color secondaryText;
  final Color green3;
  final Color gray1;
  final Color gray2;
  final Color gray3;
  final Color gray4;
  final Color gray5;
  final Color gray6;
  final Color gray26;
  final Color red;
  final Color purple2;
  final Color subtitleText;

  const BWMTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.fourthColor,
    required this.fifthColor,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.darkBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.green3,
    required this.gray1,
    required this.gray2,
    required this.gray3,
    required this.gray4,
    required this.gray5,
    required this.gray6,
    required this.gray26,
    required this.red,
    required this.purple2,
    required this.subtitleText,
  });

  @override
  ThemeExtension<BWMTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? fourthColor,
    Color? fifthColor,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? darkBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? green3,
    Color? gray1,
    Color? gray2,
    Color? gray3,
    Color? gray4,
    Color? gray5,
    Color? gray6,
    Color? gray26,
    Color? red,
    Color? purple2,
    Color? subtitleText,
  }) =>
      BWMTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        fourthColor: fourthColor ?? this.fourthColor,
        fifthColor: fifthColor ?? this.fifthColor,
        primaryBackground: primaryBackground ?? this.primaryBackground,
        secondaryBackground: secondaryBackground ?? this.secondaryBackground,
        darkBackground: darkBackground ?? this.darkBackground,
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
        green3: green3 ?? this.green3,
        gray1: gray1 ?? this.gray1,
        gray2: gray2 ?? this.gray2,
        gray3: gray3 ?? this.gray3,
        gray4: gray4 ?? this.gray4,
        gray5: gray5 ?? this.gray5,
        gray6: gray6 ?? this.gray6,
        gray26: gray26 ?? this.gray26,
        red: red ?? this.red,
        purple2: purple2 ?? this.purple2,
        subtitleText: subtitleText ?? this.subtitleText,
      );

  BWMTypography get typography => BWMTypography();

  @override
  ThemeExtension<BWMTheme> lerp(
    covariant ThemeExtension<BWMTheme>? other,
    double t,
  ) {
    if (other is! BWMTheme) {
      return this;
    }
    return BWMTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      fourthColor: Color.lerp(fourthColor, other.fourthColor, t)!,
      fifthColor: Color.lerp(fifthColor, other.fifthColor, t)!,
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      darkBackground: Color.lerp(darkBackground, other.darkBackground, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      green3: Color.lerp(green3, other.green3, t)!,
      gray1: Color.lerp(gray1, other.gray1, t)!,
      gray2: Color.lerp(gray2, other.gray2, t)!,
      gray3: Color.lerp(gray4, other.gray3, t)!,
      gray4: Color.lerp(gray4, other.gray4, t)!,
      gray5: Color.lerp(gray5, other.gray5, t)!,
      gray6: Color.lerp(gray6, other.gray6, t)!,
      gray26: Color.lerp(gray26, other.gray26, t)!,
      red: Color.lerp(red, other.red, t)!,
      purple2: Color.lerp(purple2, other.purple2, t)!,
      subtitleText: Color.lerp(subtitleText, other.subtitleText, t)!,
    );
  }
}
