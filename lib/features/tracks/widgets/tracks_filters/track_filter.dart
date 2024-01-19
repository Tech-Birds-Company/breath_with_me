import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrackFilter extends StatefulWidget {
  final String filterTitle;
  final bool isSelecting;
  final bool isSelected;
  final VoidCallback onTap;

  const TrackFilter({
    required this.filterTitle,
    required this.isSelecting,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  State<TrackFilter> createState() => _TrackFilterState();
}

class _TrackFilterState extends State<TrackFilter> {
  var _turns = 0.0;

  @override
  void didUpdateWidget(covariant TrackFilter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelecting != widget.isSelecting) {
      setState(() => _turns += widget.isSelecting ? -0.5 : 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 36,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: widget.isSelecting
                  ? theme.secondaryColor
                  : theme.secondaryBackground,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  widget.filterTitle,
                  style: theme.typography.bodyMTrue.copyWith(
                    color: widget.isSelecting
                        ? theme.secondaryColor
                        : widget.isSelected
                            ? theme.secondaryColor
                            : theme.fifthColor,
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: _turns,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  child: SvgPicture.asset(
                    BWMAssets.dropdownArrowIcon,
                    colorFilter: ColorFilter.mode(
                      widget.isSelecting
                          ? theme.secondaryColor
                          : theme.fifthColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
