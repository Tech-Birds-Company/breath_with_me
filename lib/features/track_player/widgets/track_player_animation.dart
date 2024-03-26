import 'dart:async';
import 'dart:io';

import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

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
  StreamSubscription<bool>? _isPlayingSub;

  double _time = 0;
  bool _isPlaying = false;
  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((elapsed) {
      if (_isPlaying) {
        _time += 0.05;
        setState(() {});
      }
    });
    super.initState();
    _isPlayingSub ??= widget.isPlayingStream.listen(
      (state) => setState(() => _isPlaying = state),
    );
    _ticker.start();
  }

  @override
  void dispose() {
    _isPlayingSub?.cancel();
    _isPlayingSub = null;
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ShaderBuilder(
        (context, shader, child) {
          final theme = Theme.of(context).extension<BWMTheme>()!;
          final color = widget.animationColor ?? theme.secondaryColor;
          return AnimatedSampler(
            (image, size, canvas) {
              shader.setFloatUniforms(
                (value) {
                  value
                    ..setFloat(_time)
                    ..setSize(
                      Platform.isIOS
                          ? size
                          : Size(
                              size.width / 3,
                              size.height / 3,
                            ),
                    )
                    ..setFloat(color.red / 255)
                    ..setFloat(color.green / 255)
                    ..setFloat(color.blue / 255)
                    ..setFloat(-1.2);
                },
              );
              canvas.drawRect(
                Rect.fromCenter(
                  center: Offset(size.width / 2, size.height / 2),
                  width: size.width,
                  height: size.height,
                ),
                Paint()..shader = shader,
              );
            },
            child: child!,
          );
        },
        assetKey: BWMAssets.trackPlayerAnimation,
        child: const SizedBox.expand(),
      );
}
