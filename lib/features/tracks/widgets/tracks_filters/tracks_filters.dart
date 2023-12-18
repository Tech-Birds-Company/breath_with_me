import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:breathe_with_me/features/tracks/widgets/tracks_filters/track_filter.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TracksFilters extends HookConsumerWidget {
  const TracksFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EasyLocalization.of(context);
    final bloc = ref.watch(Di.shared.bloc.tracksFilters);

    useEffect(
      () {
        bloc.init();
        return bloc.dispose;
      },
      const [],
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _CategoriesFilter(bloc),
          const SizedBox(width: 8),
          _LanguagesFilter(bloc),
          const SizedBox(width: 8),
          _LikedTracksFilter(bloc),
        ],
      ),
    );
  }
}

class _CategoriesFilter extends StatelessWidget {
  final TracksFiltersBloc _bloc;

  const _CategoriesFilter(
    this._bloc, {
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocSelector<TracksFiltersBloc, TracksFiltersState, (bool, String?)>(
        bloc: _bloc,
        selector: (state) =>
            (state.selectingCategory, state.selectedCategoryKey),
        builder: (context, value) => TrackFilter(
          filterTitle: value.$2?.tr() ?? LocaleKeys.trackCategoryAll.tr(),
          isSelecting: value.$1,
          isSelected: value.$2 != null,
          onTap: _bloc.openCategoryFilterSheet,
        ),
      );
}

class _LanguagesFilter extends StatelessWidget {
  final TracksFiltersBloc _bloc;

  const _LanguagesFilter(
    this._bloc, {
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocSelector<TracksFiltersBloc, TracksFiltersState, (bool, String?)>(
        bloc: _bloc,
        selector: (state) =>
            (state.selectingLanguage, state.selectedLanguageKey),
        builder: (context, value) => TrackFilter(
          filterTitle: value.$2?.tr() ?? LocaleKeys.trackLanguageAll.tr(),
          onTap: _bloc.openLanguageFilterSheet,
          isSelecting: value.$1,
          isSelected: value.$2 != null,
        ),
      );
}

class _LikedTracksFilter extends StatelessWidget {
  final TracksFiltersBloc _bloc;

  const _LikedTracksFilter(
    this._bloc, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return GestureDetector(
      onTap: _bloc.onLikedTracksFilterToggle,
      child: SizedBox(
        width: 48,
        height: 36,
        child: BlocSelector<TracksFiltersBloc, TracksFiltersState, bool>(
          bloc: _bloc,
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
    );
  }
}