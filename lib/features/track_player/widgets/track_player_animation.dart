import 'dart:async';
import 'dart:math';

import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TrackPlayerAnimation extends StatefulWidget {
  final Stream<bool> isPlayingStream;
  final Color? animationColor;

  const TrackPlayerAnimation({
    required this.isPlayingStream,
    this.animationColor,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => TrackPlayerAnimationState();
}

class TrackPlayerAnimationState extends State<TrackPlayerAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  StreamSubscription<bool>? _isPlayingSub;

  @override
  void initState() {
    super.initState();
    _isPlayingSub ??= widget.isPlayingStream.listen(
      (state) {
        if (state) {
          _controller.loop();
        } else {
          _controller.stop();
        }
      },
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _isPlayingSub?.cancel();
    _isPlayingSub = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SizedBox(
      width: 100,
      height: 100,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => CustomPaint(
          painter: _TrackPlayerAnimationPainter(
            progress: _controller.value,
            animationColor: widget.animationColor ?? theme.secondaryColor,
          ),
        ),
      ),
    );
  }
}

class _TrackPlayerAnimationPainter extends CustomPainter {
  final Color animationColor;
  final double progress;
  final noise = PerlinNoise();

  _TrackPlayerAnimationPainter({
    required this.progress,
    required this.animationColor,
  });

  double _radians(double degrees) => degrees * (pi / 180.0);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = animationColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    const baseRadius = 150.0;
    const noiseScale = 1;
    final noiseOffset = cos(progress * 2 * pi) * 100 +
        noise.getNoise2(
          Random().nextInt(100).toDouble(),
          Random().nextInt(100).toDouble(),
        );

    final outerRingPath1 = Path();

    for (var i = 0; i < 360; i++) {
      final angle = _radians(i.toDouble());
      final noiseValue = noise.getNoise2(
        (size.width * noiseScale) * cos(angle) + noiseOffset,
        (size.height * noiseScale) * sin(angle) + noiseOffset,
      );
      final radius = baseRadius + (noiseValue * 30.0);
      final x = size.center(Offset.zero).dx + radius * cos(angle);
      final y = size.center(Offset.zero).dy + radius * sin(angle);

      if (i == 0) {
        outerRingPath1.moveTo(x, y);
      } else {
        outerRingPath1.lineTo(x, y);
      }
    }

    outerRingPath1.close();
    canvas
      ..drawPath(outerRingPath1, paint)
      ..drawShadow(
        outerRingPath1,
        animationColor,
        10,
        true,
      )
      ..drawShadow(
        outerRingPath1,
        animationColor,
        50,
        true,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
