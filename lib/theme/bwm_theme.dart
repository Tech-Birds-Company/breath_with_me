import 'package:breathe_with_me/theme/bwm_typography.dart';
import 'package:flutter/material.dart';

class BWMTheme extends ThemeExtension<BWMTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color fourthColor;
  final Color fifthColor;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color primaryText;
  final Color secondaryText;
  final Color green4;
  final Color gray4;
  final Color gray6;

  const BWMTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.fourthColor,
    required this.fifthColor,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.green4,
    required this.gray4,
    required this.gray6,
  });

  @override
  ThemeExtension<BWMTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? fourthColor,
    Color? fifthColor,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? green4,
    Color? gray4,
    Color? gray6,
  }) {
    return BWMTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      fourthColor: fourthColor ?? this.fourthColor,
      fifthColor: fifthColor ?? this.fifthColor,
      primaryBackground: primaryBackground ?? this.primaryBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      green4: green4 ?? this.green4,
      gray4: gray4 ?? this.gray4,
      gray6: gray6 ?? this.gray6,
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
      fourthColor: Color.lerp(fourthColor, other.fourthColor, t)!,
      fifthColor: Color.lerp(fifthColor, other.fifthColor, t)!,
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      green4: Color.lerp(green4, other.green4, t)!,
      gray4: Color.lerp(gray4, other.gray4, t)!,
      gray6: Color.lerp(gray6, other.gray6, t)!,
    );
  }
}
