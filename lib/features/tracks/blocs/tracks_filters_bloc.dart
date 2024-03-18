import 'dart:async';

import 'package:breathe_with_me/features/tracks/filter_type.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TracksFiltersBloc extends BlocBase<TracksFiltersState> {
  final TracksRepository _tracksRepository;
  final NavigationManager _navigationManager;

  TracksFiltersBloc(
    this._tracksRepository,
    this._navigationManager,
  ) : super(const TracksFiltersState());

  StreamSubscription<List<Track>>? _cachedTracksSubscription;

  void init() =>
      _cachedTracksSubscription ??= _tracksRepository.cachedTracksStream.listen(
        (tracks) {
          final categoriesKeys = tracks.map((e) => e.categoryKey).toSet();
          final languagesKeys = tracks.map((e) => e.language.name).toSet();
          emit(
            state.copyWith(
              categoriesKeys: categoriesKeys,
              languagesKeys: languagesKeys,
            ),
          );
        },
      );

  void onLikedTracksFilterToggle() {
    BWMAnalytics.event('onLikedTracksFilterToggle');
    emit(
      state.copyWith(likedTracksOnly: !state.likedTracksOnly),
    );
  }

  Future<void> openCategoryFilterSheet() async {
    BWMAnalytics.event('onOpenCategoryFilterSheet');
    emit(state.copyWith(selectingCategory: true));
    await _navigationManager.openFiltersSheet(FilterType.categories);
    emit(state.copyWith(selectingCategory: false));
  }

  Future<void> openLanguageFilterSheet() async {
    BWMAnalytics.event('onOpenLanguageFilterSheet');
    emit(state.copyWith(selectingLanguage: true));
    await _navigationManager.openFiltersSheet(FilterType.languages);
    emit(state.copyWith(selectingLanguage: false));
  }

  void onCategoriesFilterChanged(String categoryKey) {
    BWMAnalytics.event(
      'onCategoriesFilterChanged',
      params: {'categoryKey': categoryKey},
    );
    emit(state.copyWith(selectedCategoryKey: categoryKey));
    _navigationManager.pop();
  }

  void onCategoriesFilterReset() {
    BWMAnalytics.event('onCategoriesFilterReset');
    emit(state.copyWith(selectedCategoryKey: null));
    _navigationManager.pop();
  }

  void onLanguagesFilterChanged(String languageKey) {
    BWMAnalytics.event(
      'onLanguagesFilterChanged',
      params: {'languageKey': languageKey},
    );
    emit(state.copyWith(selectedLanguageKey: languageKey));
    _navigationManager.pop();
  }

  void onLanguagesFilterReset() {
    BWMAnalytics.event('onLanguagesFilterReset');
    emit(state.copyWith(selectedLanguageKey: null));
    _navigationManager.pop();
  }

  void dispose() {
    _cachedTracksSubscription?.cancel();
    _cachedTracksSubscription = null;
  }
}
