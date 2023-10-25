import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/features/practices/blocs/practice_list_bloc.dart';
import 'package:breathe_with_me/features/practices/models/practice_list_state.dart';
import 'package:breathe_with_me/features/practices/widgets/practice_item.dart';
import 'package:breathe_with_me/features/practices/widgets/shimmer_list.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PracticesList extends HookConsumerWidget {
  const PracticesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.shared.bloc.practiceList);
    useEffect(
      () {
        bloc.loadTracks();
        return null;
      },
      const [],
    );
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BlocBuilder<PracticeListBloc, PracticeListState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when(
          data: (tracks) {
            return SliverList.separated(
              itemCount: tracks.length,
              separatorBuilder: (context, index) {
                if (index == tracks.length - 1) {
                  return null;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    color: theme.secondaryBackground,
                    thickness: 1,
                    height: 0,
                  ),
                );
              },
              itemBuilder: (context, index) {
                final track = tracks[index];
                return PracticeItem(
                  key: ValueKey(track.id),
                  track: track,
                  onTap: () {
                    bloc.openTrackPlayer(track.id);
                  },
                );
              },
            );
          },
          loading: () {
            return const ShimmerList();
          },
          error: () {
            return const SizedBox.shrink().toSliver;
          },
        );
      },
    );
  }
}
