import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks_list_state.freezed.dart';

part 'tracks_list_state.g.dart';

@freezed
class TracksListState with _$TracksListState {
  const factory TracksListState.data(
    List<Track> tracks, {
    List<Track>? filteredTracks,
  }) = TracksListStateData;

  const factory TracksListState.loading() = _TracksListStateLoading;

  const factory TracksListState.error() = _TracksListStateError;

  factory TracksListState.fromJson(Map<String, dynamic> json) =>
      _$TracksListStateFromJson(json);
}
