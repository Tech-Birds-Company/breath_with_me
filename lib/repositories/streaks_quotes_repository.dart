import 'dart:math';

import 'package:breathe_with_me/database/schemas/quotes_schema.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class StreaksQuotesRepository {
  final DatabaseManager _databaseManager;

  const StreaksQuotesRepository(this._databaseManager);

  static const _collection = 'quotes';

  int _quoteRandomSeed() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch ^ now.minute ^ now.second;
  }

  Future<List<StreakQuoteData>> fetchQuotes() async {
    final snapshot =
        await FirebaseFirestore.instance.collection(_collection).get();
    final quotes = snapshot.docs.map((doc) {
      return StreakQuoteData.fromJson(doc.data());
    }).toList();
    final dbQuotes = quotes
        .map(
          (q) => Quotes(
            language: q.language,
            quote: q.quote,
            author: q.author,
          ),
        )
        .toList();
    await _databaseManager.saveQuotes(dbQuotes);
    return quotes;
  }

  Future<StreakQuoteData?> getQuote(String language) async {
    final dbQuotes = await _databaseManager.loadQuotes();
    final quotes = dbQuotes
        .map(
          (quote) => StreakQuoteData(
            author: quote.author,
            language: quote.language,
            quote: quote.quote,
          ),
        )
        .toList();

    if (quotes.isEmpty) {
      return null;
    }

    final filteredQuotes = quotes
        .where((quote) => quote.language.toLowerCase() == language)
        .toList();

    if (filteredQuotes.isEmpty) {
      return null;
    }

    final random = Random(_quoteRandomSeed());
    final randomIndex = random.nextInt(filteredQuotes.length);
    return filteredQuotes[randomIndex];
  }
}
