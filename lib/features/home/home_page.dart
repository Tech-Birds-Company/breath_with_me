import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/home/widgets/home_header.dart';
import 'package:breathe_with_me/features/practices/widgets/practices_filters.dart';
import 'package:breathe_with_me/features/practices/widgets/practices_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.shared.bloc.home);

    useEffect(
      () {
        bloc.init();
        return null;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    final navigationManager = ref.read(Di.shared.manager.navigation);
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.only(
                top: 28,
                start: 24,
                end: 24,
              ),
              sliver: HomeHeader(
                onProfileTap: navigationManager.openProfile,
              ),
            ),
            const SizedBox(height: 28).toSliver,
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              sliver: const PracticesFilters().toSliver,
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              sliver: PracticesList(),
            ),
          ],
        ),
      ),
    );
  }
}
