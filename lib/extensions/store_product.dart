import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

extension StoreProductX on StoreProduct {
  Period? _periodFromIso(String? iso) {
    if (iso == null) {
      return null;
    }

    final match = RegExp(r'P(\d+)([A-Z]+)').firstMatch(iso);
    if (match == null) {
      return null;
    }

    final count = int.tryParse(match.group(1) ?? '');
    final unit = match.group(2);

    if (count == null || unit == null) {
      return null;
    }

    return Period(
      switch (unit) {
        'Y' => PeriodUnit.year,
        'M' => PeriodUnit.month,
        'W' => PeriodUnit.week,
        'D' => PeriodUnit.day,
        _ => PeriodUnit.unknown,
      },
      count,
      iso,
    );
  }

  String get localizedTitleKey {
    final billingPeriod =
        defaultOption?.billingPeriod ?? _periodFromIso(subscriptionPeriod);

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
