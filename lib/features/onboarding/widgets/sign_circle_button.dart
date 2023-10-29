import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SignCircleButtonProvider {
  apple,
  google,
  email,
}

class SignCircleButton extends StatelessWidget {
  final SignCircleButtonProvider provider;
  final VoidCallback onPressed;

  const SignCircleButton({
    required this.provider,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(54, 54),
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
      ),
      child: SvgPicture.asset(
        _getIconName(provider),
        width: 34,
        height: 34,
      ),
    );
  }

  String _getIconName(SignCircleButtonProvider provider) {
    switch (provider) {
      case SignCircleButtonProvider.apple:
        return BWMAssets.signAppleIcon;
      case SignCircleButtonProvider.google:
        return BWMAssets.signGoogleIcon;
      case SignCircleButtonProvider.email:
        return BWMAssets.signMailIcon;
    }
  }
}
