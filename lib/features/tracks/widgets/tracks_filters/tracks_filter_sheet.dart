import 'dart:io';

import 'package:breathe_with_me/common/widgets/bottom_sheet_notch.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/tracks_filter_type.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TracksFilterSheet extends ConsumerWidget {
  final TracksFilterType filterType;

  const TracksFilterSheet({
    required this.filterType,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.bloc.tracksFilters);
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: ColoredBox(
        color: theme.primaryBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BottomSheetNotch(),
                _FilterList(
                  filterType: filterType,
                  bloc: bloc,
                ),
                _ResetButton(
                  filterType: filterType,
                  bloc: bloc,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterList extends StatelessWidget {
  final TracksFilterType filterType;
  final TracksFiltersBloc bloc;

  const _FilterList({
    required this.filterType,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    final itemsKeys = filterType == TracksFilterType.categories
        ? bloc.state.categoriesKeys
        : bloc.state.languagesKeys;

    return Column(
      children: ListTile.divideTiles(
        context: context,
        color: const Color(0x995D5D6D),
        tiles: itemsKeys
            .map(
              (itemKey) => _FilterListItem(
                itemKey: itemKey,
                bloc: bloc,
                filterType: filterType,
              ),
            )
            .toList(),
      ).toList(),
    );
  }
}

class _FilterListItem extends StatelessWidget {
  final String itemKey;
  final TracksFiltersBloc bloc;
  final TracksFilterType filterType;

  const _FilterListItem({
    required this.itemKey,
    required this.bloc,
    required this.filterType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        switch (filterType) {
          case TracksFilterType.categories:
            bloc.onCategoriesFilterChanged(itemKey);
          case TracksFilterType.languages:
            bloc.onLanguagesFilterChanged(itemKey);
        }
      },
      minLeadingWidth: 0,
      horizontalTitleGap: 8,
      leading: itemKey == LocaleKeys.trackCategoryPremium
          ? Icon(
              Icons.workspace_premium,
              color: theme.purple2,
            )
          : null,
      title: Text(
        itemKey.tr(),
        style: theme.typography.bodyM.copyWith(color: theme.primaryText),
      ),
      trailing: (filterType == TracksFilterType.categories
                  ? bloc.state.selectedCategoryKey
                  : bloc.state.selectedLanguageKey) ==
              itemKey
          ? Icon(Icons.check_circle_rounded, color: theme.secondaryColor)
          : null,
    );
  }
}

class _ResetButton extends StatelessWidget {
  final TracksFilterType filterType;
  final TracksFiltersBloc bloc;

  const _ResetButton({
    required this.filterType,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    final shouldShowResetButton = (bloc.state.selectedCategoryKey != null &&
            filterType == TracksFilterType.categories) ||
        (bloc.state.selectedLanguageKey != null &&
            filterType == TracksFilterType.languages);

    return shouldShowResetButton
        ? Padding(
            padding: EdgeInsets.only(
              top: 16,
              bottom: Platform.isAndroid ? 8 : 0,
            ),
            child: BWMActionButton(
              width: double.infinity,
              height: 40,
              title: LocaleKeys.tracksFilterReset.tr(),
              onPressed: () {
                switch (filterType) {
                  case TracksFilterType.categories:
                    bloc.onCategoriesFilterReset();
                  case TracksFilterType.languages:
                    bloc.onLanguagesFilterReset();
                }
              },
            ),
          )
        : const SizedBox.shrink();
  }
}
