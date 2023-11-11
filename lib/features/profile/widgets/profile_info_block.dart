import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileInfoBlock extends StatelessWidget {
  const ProfileInfoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return const Stack(
      children: [
        SizedBox(
          height: 246,
          width: 350,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xeb000000),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        Text(
          'data',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
