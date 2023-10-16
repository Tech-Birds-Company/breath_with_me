import 'package:breathe_with_me/theme/bwm_typography.dart';
import 'package:flutter/material.dart';

class BWMTheme extends ThemeExtension<BWMTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color fourthColor;
  final Color fifthColor;
  final Color sixthColor;
  final Color seventhColor;
  final Color darkBlueColor;
  final Color alternate;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color primaryText;
  final Color secondaryText;
  final Color purpleText;

  const BWMTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.fourthColor,
    required this.fifthColor,
    required this.sixthColor,
    required this.seventhColor,
    required this.darkBlueColor,
    required this.alternate,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.purpleText,
  });

  @override
  ThemeExtension<BWMTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? fourthColor,
    Color? fifthColor,
    Color? sixthColor,
    Color? seventhColor,
    Color? darkBlueColor,
    Color? alternate,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? purpleText,
  }) {
    return BWMTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      fourthColor: fourthColor ?? this.fourthColor,
      fifthColor: fifthColor ?? this.fifthColor,
      sixthColor: sixthColor ?? this.sixthColor,
      seventhColor: seventhColor ?? this.seventhColor,
      darkBlueColor: darkBlueColor ?? this.darkBlueColor,
      alternate: alternate ?? this.alternate,
      primaryBackground: primaryBackground ?? this.primaryBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      purpleText: purpleText ?? this.purpleText,
    );
  }

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
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      fourthColor: Color.lerp(fourthColor, other.fourthColor, t)!,
      fifthColor: Color.lerp(fifthColor, other.fifthColor, t)!,
      sixthColor: Color.lerp(sixthColor, other.sixthColor, t)!,
      seventhColor: Color.lerp(seventhColor, other.seventhColor, t)!,
      darkBlueColor: Color.lerp(darkBlueColor, other.darkBlueColor, t)!,
      alternate: Color.lerp(alternate, other.alternate, t)!,
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      purpleText: Color.lerp(purpleText, other.purpleText, t)!,
    );
  }
}
