import 'dart:convert';

import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

extension RemoteConfig on String? {
  Map<String, dynamic> get asJson =>
      jsonDecode(this?.isEmpty ?? true ? '{}' : this!) as Map<String, dynamic>;
}

extension EmailValidator on String? {
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (this == null) {
      return false;
    }
    return emailRegex.hasMatch(this!);
  }

  String get periodToText {
    if (this == null) {
      return '';
    }
    final regExp = RegExp(r'P(\d+)([WMY])');
    final match = regExp.firstMatch(this!);

    if (match != null) {
      final number = int.parse(match.group(1)!);
      final unit = match.group(2)!;

      switch (unit) {
        case 'W':
          return LocaleKeys.premium_paywall_subscriptionPeriod_W.plural(number);
        case 'M':
          return LocaleKeys.premium_paywall_subscriptionPeriod_M.plural(number);

        case 'Y':
          return LocaleKeys.premium_paywall_subscriptionPeriod_Y
              .plural(number * 12);
        default:
          return '';
      }
    } else {
      return '';
    }
  }
}
