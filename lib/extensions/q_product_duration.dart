import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

extension QDurationExtension on QProductDuration? {
  String get localizedDuration {
    switch (this) {
      case QProductDuration.weekly:
        return LocaleKeys.premium_paywall_subscriptionWeek.tr();
      case QProductDuration.monthly:
        return LocaleKeys.premium_paywall_subscriptionMonth.tr();
      case QProductDuration.threeMonths:
        return LocaleKeys.premium_paywall_subscription3Months.tr();
      case QProductDuration.sixMonths:
        return LocaleKeys.premium_paywall_subscription6months.tr();
      case QProductDuration.annual:
        return LocaleKeys.premium_paywall_subscriptionAnnual.tr();
      case QProductDuration.lifetime:
        return LocaleKeys.premium_paywall_subscriptionLifeTime.tr();
      case QProductDuration.unknown:
      case null:
        return '???';
    }
  }
}
