import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? icon;
  final bool showIndicator;
  final bool showDivider;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.showDivider = true,
    this.showIndicator = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      children: [
        Theme(
          data: baseTheme.copyWith(
            listTileTheme: baseTheme.listTileTheme.copyWith(
              minLeadingWidth: 0,
            ),
          ),
          child: ListTile(
            title: Text(
              title,
              style: theme.typography.bodyM.copyWith(
                color: theme.fifthColor,
              ),
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle!,
                    style: theme.typography.footnote.copyWith(
                      color: theme.secondaryText,
                    ),
                  )
                : null,
            horizontalTitleGap: 12,
            contentPadding: EdgeInsets.zero,
            leading: icon != null
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: SvgPicture.asset(
                        icon!,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          theme.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                : null,
            trailing: showIndicator
                ? SvgPicture.asset(
                    BWMAssets.menuArrow,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      theme.primaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                : null,
            onTap: onTap,
          ),
        ),
        if (showDivider)
          Divider(
            thickness: 1,
            color: theme.secondaryBackground,
          ),
      ],
    );
  }
}
