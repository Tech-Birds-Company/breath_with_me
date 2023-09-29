import 'package:breath_with_me/features/practices/widgets/practice_item.dart';
import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class PracticesList extends StatelessWidget {
  const PracticesList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          if (index == 9) {
            return const PracticeItem();
          }
          return Column(
            children: [
              const PracticeItem(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: theme.secondaryBackground,
                  thickness: 1,
                  height: 0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
