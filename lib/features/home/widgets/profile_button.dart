import 'package:breath_with_me/assets.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: SizedBox(
        width: 40,
        height: 40,
        child: ColoredBox(
          color: Color(0xFFF2F2F2),
          child: Image(
            image: AssetImage(BWMAssets.profileIcon),
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
