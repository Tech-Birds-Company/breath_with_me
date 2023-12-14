import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:breathe_with_me/features/tracks/widgets/track_filter.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class TracksFilters extends ConsumerWidget {
  const TracksFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.shared.bloc.tracksFilters);
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        TrackFilter(
          filterTitle: LocaleKeys.trackCategoryAll.tr(),
        ),
        const SizedBox(width: 8),
        TrackFilter(
          filterTitle: LocaleKeys.trackLanguageRu.tr(),
        ),
        const Spacer(),
        GestureDetector(
          onTap: bloc.onLikedTracksFilterToggle,
          child: SizedBox(
            width: 48,
            height: 36,
            child: BlocSelector<TracksFiltersBloc, TracksFiltersState, bool>(
              bloc: bloc,
              selector: (state) => state.likedTracksOnly,
              builder: (context, onlyLiked) => DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: onlyLiked
                        ? theme.secondaryColor
                        : theme.secondaryBackground,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    onlyLiked ? BWMAssets.heartIconFilled : BWMAssets.heartIcon,
                    colorFilter: ColorFilter.mode(
                      onlyLiked ? theme.secondaryColor : theme.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
