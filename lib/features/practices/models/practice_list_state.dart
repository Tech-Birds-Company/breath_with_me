import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_list_state.freezed.dart';
part 'practice_list_state.g.dart';

@freezed
abstract class PracticeListState with _$PracticeListState {
  const factory PracticeListState.data(List<Track> tracks) = _Data;
  const factory PracticeListState.loading() = _Loading;
  const factory PracticeListState.error() = _Error;

  factory PracticeListState.fromJson(Map<String, dynamic> json) =>
      _$PracticeListStateFromJson(json);
}
