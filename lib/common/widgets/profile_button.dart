import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const ProfileButton({
    required this.size,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: ClipOval(
          child: DependencyProvider(
            provider: Di.manager.subscriptions,
            builder: (context, dependency) => StreamBuilder<bool>(
              stream: dependency.premiumEnabledStream,
              initialData: false,
              builder: (context, snapshot) {
                final theme = Theme.of(context).extension<BWMTheme>()!;
                final premiumEnabled = snapshot.requireData;
                return SizedBox(
                  width: size,
                  height: size,
                  child: ColoredBox(
                    color: premiumEnabled ? theme.purple2 : theme.gray6,
                    child: Center(
                      child: SvgPicture.asset(
                        BWMAssets.profileIcon,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          premiumEnabled ? theme.primaryColor : theme.gray1,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
}
