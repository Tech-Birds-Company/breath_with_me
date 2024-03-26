import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks_list_state.freezed.dart';
part 'tracks_list_state.g.dart';

@freezed
abstract class TracksListState with _$TracksListState {
  const factory TracksListState.data(List<Track> tracks) = _Data;
  const factory TracksListState.loading() = _Loading;
  const factory TracksListState.error() = _Error;

  factory TracksListState.fromJson(Map<String, dynamic> json) =>
      _$TracksListStateFromJson(json);
}
