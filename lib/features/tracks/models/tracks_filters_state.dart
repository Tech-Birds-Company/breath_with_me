import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks_filters_state.freezed.dart';

@freezed
class TracksFiltersState with _$TracksFiltersState {
  const factory TracksFiltersState({
    @Default([]) List<String> categoriesKeys,
    @Default([]) List<String> languagesKeys,
    @Default(false) bool likedTracksOnly,
    @Default(false) bool selectingCategory,
    @Default(false) bool selectingLanguage,
    String? selectedLanguageKey,
    String? selectedCategoryKey,
  }) = _TracksFiltersState;
}
