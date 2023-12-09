import 'package:breathe_with_me/features/practices/models/practice_list_state.dart';
import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class PracticeListBloc extends CacheableBloc<PracticeListState> {
  final NavigationManager _navigationManager;
  final TracksRepository _tracksRepository;

  PracticeListBloc(
    this._navigationManager,
    this._tracksRepository,
  ) : super(const PracticeListState.loading());

  Stream<bool> trackIsDownloadedStream(String trackId) {
    return _tracksRepository.getTrackIsDownloadedStream(trackId);
  }

  Future<void> loadTracks() async {
    final tracks = await _tracksRepository.getTracks();
    emit(PracticeListState.data(tracks));
    await cache();
  }

  void openTrackPlayerById(String trackId) {
    _navigationManager.openTrackPlayer(trackId);
  }

  void openTrackPlayerByTrack(Track track) {
    _navigationManager.openTrackPlayer(
      track.id,
      track: track,
    );
  }

  @override
  PracticeListState fromJson(Map<String, dynamic> json) {
    return PracticeListState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PracticeListState state) {
    return state.toJson();
  }
}
