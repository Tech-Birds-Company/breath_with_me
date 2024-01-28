import 'dart:ui';

import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SighUpSuccess extends StatelessWidget {
  final NavigationManager navigationManager;

  const SighUpSuccess({
    required this.navigationManager,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.8,
              child: SizedBox.expand(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF631295),
                        const Color(0xFF3B0B58).withOpacity(0.75),
                        const Color(0xFF000000),
                      ],
                      stops: const [
                        0.0,
                        0.5,
                        1.0,
                      ],
                      center: const Alignment(0, -0.25),
                      radius: 1,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: navigationManager.pop,
                    icon: Icon(
                      Icons.close,
                      color: theme.gray4,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: ColoredBox(
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    SvgPicture.asset(
                      width: 88,
                      height: 88,
                      BWMAssets.heartIcon,
                      colorFilter: ColorFilter.mode(
                        theme.gray4,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Text(
                        'Account is created successfully',
                        textAlign: TextAlign.center,
                        style: theme.typography.heading2.copyWith(
                          color: theme.primaryColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
