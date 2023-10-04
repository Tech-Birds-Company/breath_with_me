import 'package:breathe_with_me/features/practices/widgets/practice_item.dart';
import 'package:breathe_with_me/navigation/routes.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PracticesList extends StatelessWidget {
  const PracticesList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 9) {
          return PracticeItem(
            onTap: () {
              context.push(BWMRoutes.player);
            },
          );
        }
        return Column(
          children: [
            PracticeItem(
              onTap: () {
                context.push(BWMRoutes.player);
              },
            ),
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
    );
  }
}
