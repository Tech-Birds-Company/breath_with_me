import 'package:breath_with_me/assets.dart';
import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PracticeFilter extends StatelessWidget {
  final String filterTitle;

  const PracticeFilter({
    required this.filterTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SizedBox(
      height: 36,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: theme.secondaryBackground,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                filterTitle,
                style: theme.typography.bodyMTrue.copyWith(
                  color: theme.fifthColor,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(BWMAssets.dropdownArrowIcon),
            ],
          ),
        ),
      ),
    );
  }
}
