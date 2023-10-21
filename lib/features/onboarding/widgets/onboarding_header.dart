import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 28,
        start: 28,
      ),
      child: SvgPicture.asset(
        BWMAssets.logoIcon,
        width: 111,
      ),
    );
  }
}
