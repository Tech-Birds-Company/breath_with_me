import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BWMAppBar extends ConsumerWidget implements PreferredSizeWidget {
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
      Size.fromHeight(title == null ? appBarHeight : appBarHeight + 37);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final navigationManager = ref.watch(Di.manager.navigation);
    return SafeArea(
      child: ColoredBox(
        color: backgroundColor ?? theme.primaryBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: navigationManager.pop,
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: theme.green3,
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
