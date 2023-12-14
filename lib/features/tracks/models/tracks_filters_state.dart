import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks_filters_state.freezed.dart';

@freezed
class TracksFiltersState with _$TracksFiltersState {
  const factory TracksFiltersState({
    @Default(false) bool likedTracksOnly,
  }) = _TracksFiltersState;
}
