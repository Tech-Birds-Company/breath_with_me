import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_player_state.freezed.dart';
part 'track_player_state.g.dart';

@freezed
class TrackPlayerState with _$TrackPlayerState {
  const factory TrackPlayerState({
    @Default(true) bool isPaused,
    double? progress,
  }) = _TrackPlayerState;

  factory TrackPlayerState.fromJson(Map<String, dynamic> json) =>
      _$TrackPlayerStateFromJson(json);
}
