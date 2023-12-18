import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks_filters_state.freezed.dart';

@freezed
class TracksFiltersState with _$TracksFiltersState {
  const factory TracksFiltersState({
    @Default({}) Set<String> categoriesKeys,
    @Default({}) Set<String> languagesKeys,
    @Default(false) bool likedTracksOnly,
    @Default(false) bool selectingCategory,
    @Default(false) bool selectingLanguage,
    String? selectedLanguageKey,
    String? selectedCategoryKey,
  }) = _TracksFiltersState;
}
