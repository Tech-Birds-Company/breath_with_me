import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  static const _logoSize = Size(111, 39.12);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 44,
        start: 28,
      ),
      child: SizedBox(
        width: _logoSize.width,
        height: _logoSize.height,
        child: SvgPicture.asset(
          BWMAssets.logoIcon,
          width: _logoSize.width,
          height: _logoSize.height,
        ),
      ),
    );
  }
}
