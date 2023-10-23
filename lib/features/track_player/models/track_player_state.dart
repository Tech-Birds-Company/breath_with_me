import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_player_state.freezed.dart';
part 'track_player_state.g.dart';

@freezed
class TrackPlayerState with _$TrackPlayerState {
  static const initialState = TrackPlayerState();
  const factory TrackPlayerState({
    @Default(true) bool isPaused,
    @Default(0) double downloadProgress,
    double? progress,
  }) = _TrackPlayerState;

  factory TrackPlayerState.fromJson(Map<String, dynamic> json) =>
      _$TrackPlayerStateFromJson(json);
}
