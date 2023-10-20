import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_list_state.freezed.dart';
part 'practice_list_state.g.dart';

@freezed
class PracticeListState with _$PracticeListState {
  const factory PracticeListState({
    @Default([]) List<Track> tracks,
  }) = _PracticeListState;

  factory PracticeListState.fromJson(Map<String, dynamic> json) =>
      _$PracticeListStateFromJson(json);
}
