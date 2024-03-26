import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SignCircleButtonProvider {
  apple(iconName: BWMAssets.signAppleIcon),
  google(iconName: BWMAssets.signGoogleIcon),
  email(iconName: BWMAssets.signMailIcon);

  const SignCircleButtonProvider({
    required this.iconName,
  });

  final String iconName;
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
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(54, 54),
        shape: const CircleBorder(),
        backgroundColor: theme.primaryColor,
      ),
      child: SvgPicture.asset(
        provider.iconName,
        width: 34,
        height: 34,
      ),
    );
  }
}
