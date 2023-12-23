import 'dart:math';
import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';

final class StreaksQuotesRepository {
  const StreaksQuotesRepository();

  static const Map<String, List<StreakQuoteData>> _quotes = {
    'en': [
      StreakQuoteData(
        quote:
            'We cannot breathe in the past or the future. We inhale and exhale always in the present',
        author: 'Dasha Chen',
      ),
    ],
    'ru': [
      StreakQuoteData(
        quote:
            'Мы не можем дышать ни в прошлом, ни в будущем. Мы делаем вдох и выдох всегда в настоящем.',
        author: 'Даша Чен',
      ),
    ],
  };

  StreakQuoteData getQuote(String languageCode) {
    final quotes = _quotes[languageCode]!;
    return quotes[Random().nextInt(quotes.length)];
  }
}
