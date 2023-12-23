import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:flutter/material.dart';

class StreakWithoutPro extends StatelessWidget {
  final int selectedDay;
  final StreakQuoteData quote;

  const StreakWithoutPro({
    required this.selectedDay,
    required this.quote,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[
      StreakWeeks(selectedDay: selectedDay),
      StreakQuote(data: quote),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
        separatorBuilder: (context, index) => const SizedBox(height: 24),
      ),
    );
  }
}
