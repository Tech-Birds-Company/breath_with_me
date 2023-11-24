import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileInfoBlock extends StatelessWidget {
  const ProfileInfoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Stack(
      children: [
        const SizedBox(
          height: 246,
          width: 350,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xeb000000), // TODO: Use color from theme
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Center(
                      child: SvgPicture.asset(
                        BWMAssets.checkmark,
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          theme.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      LocaleKeys.profileProgress,
                      style: theme.typography.bodyM.copyWith(
                        color: theme.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Center(
                      child: SvgPicture.asset(
                        BWMAssets.checkmark,
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          theme.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      LocaleKeys.profileStreak,
                      style: theme.typography.bodyM.copyWith(
                        color: theme.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  LocaleKeys.profileGetPremium,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    '5',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const SizedBox(
                    width: 50,
                    child: Text(
                      LocaleKeys.profileTotalFriends,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 5,
                    color: Colors.white,
                  ),
                  const Text(
                    '2/3',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const SizedBox(
                    width: 150,
                    child: Text(
                      LocaleKeys.profileFriendsUntilPremium,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: SvgPicture.asset(
                      BWMAssets.share,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        theme.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
