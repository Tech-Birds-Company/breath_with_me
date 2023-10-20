import 'package:breathe_with_me/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 40,
        height: 40,
        child: ColoredBox(
          color: const Color(0xFFF2F2F2), // TODO(vasidmi): update theme
          child: Center(
            child: SvgPicture.asset(
              BWMAssets.profileIcon,
            ),
          ),
        ),
      ),
    );
  }
}
