import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BWMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final double height;
  final String? title;

  const BWMAppBar({
    required this.color,
    this.height = 112,
    this.title,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SafeArea(
      child: Container(
        height: height,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
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
              const SizedBox(height: 36),
              if (title != null)
                Text(
                  title!,
                  style: theme.typography.heading.copyWith(
                    color: theme.primaryText,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
