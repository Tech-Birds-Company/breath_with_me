import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

extension StoreProductX on StoreProduct {
  String get localizedTitleKey {
    final billingPeriod = defaultOption?.billingPeriod;
    if (billingPeriod == null) {
      return title;
    }

    final unit = billingPeriod.unit;
    final count = billingPeriod.value;

    return switch (unit) {
      PeriodUnit.day =>
        LocaleKeys.premium_paywall_periodUnitCount_day.plural(count),
      PeriodUnit.week =>
        LocaleKeys.premium_paywall_periodUnitCount_week.plural(count),
      PeriodUnit.month =>
        LocaleKeys.premium_paywall_periodUnitCount_month.plural(count),
      PeriodUnit.year =>
        LocaleKeys.premium_paywall_periodUnitCount_month.plural(count * 12),
      PeriodUnit.unknown => title,
    };
  }
}
