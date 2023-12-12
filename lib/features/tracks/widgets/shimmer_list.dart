import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Divider(
            color: theme.secondaryBackground,
            thickness: 1,
            height: 0,
          ),
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return const _ShimmerItem();
      },
    );
  }
}

class _ShimmerItem extends StatelessWidget {
  const _ShimmerItem();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _ShimmerPlaceholder(
                width: 103,
                height: 103,
                borderRadius: 12,
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShimmerPlaceholder(width: 100, height: 20),
            SizedBox(height: 12),
            _ShimmerPlaceholder(width: 70, height: 20),
            SizedBox(height: 12),
            Row(
              children: [
                _ShimmerPlaceholder(
                  width: 28,
                  height: 28,
                  borderRadius: 14,
                ),
                SizedBox(width: 8),
                _ShimmerPlaceholder(
                  width: 150,
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const _ShimmerPlaceholder({
    required this.width,
    required this.height,
    this.borderRadius = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ColoredBox(
        color: theme.secondaryBackground,
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          delay: 700.milliseconds,
          duration: 700.milliseconds,
          color: theme.primaryBackground.withOpacity(0.2),
        );
  }
}
