import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BWMAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double appBarHeight = 52;

  final String? title;
  final Color? backgroundColor;

  const BWMAppBar({
    this.title,
    this.backgroundColor,
    super.key,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(title == null ? appBarHeight : appBarHeight + 36);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SafeArea(
      child: ColoredBox(
        color: backgroundColor ?? theme.primaryBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: context.pop,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: theme.green3,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LocaleKeys.appBarBackTitle.tr(),
                      style: theme.typography.bodyMTrue.copyWith(
                        color: theme.green3,
                      ),
                    ),
                  ],
                ),
              ),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: Text(
                    title!,
                    style: theme.typography.heading.copyWith(
                      color: theme.primaryText,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
