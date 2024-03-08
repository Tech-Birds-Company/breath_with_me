import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_player_state.freezed.dart';

@freezed
class TrackPlayerState with _$TrackPlayerState {
  static const initialState = TrackPlayerState();

  const factory TrackPlayerState({
    @Default(true) bool isPaused,
    @Default(0) double downloadProgress,
    @Default(0) int currentTimeMs,
    @Default(0) int totalMs,
  }) = _TrackPlayerState;
}
