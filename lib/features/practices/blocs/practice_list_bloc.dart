import 'dart:async';

import 'package:breathe_with_me/features/practices/models/practice_list_state.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class PracticeListBloc extends CacheableBloc<PracticeListState> {
  final TracksRepository _tracksRepository;

  PracticeListBloc(this._tracksRepository)
      : super(const PracticeListState.loading());

  StreamSubscription<Set<String>>? _firebaseLikedTracksSubscription;

  Future<void> init() async {
    _firebaseLikedTracksSubscription ??=
        _tracksRepository.firebaseLikedTracksStream.listen(
      (event) => _syncLikedTracks(
        event.toList(),
      ),
    );
    await _loadTracks();
  }

  Future<void> _syncLikedTracks(List<String> likedTracksFromFirebase) =>
      _tracksRepository.cacheLikedTracks(likedTracksFromFirebase);

  Future<void> _loadTracks() async {
    final tracks = await _tracksRepository.getTracks();
    emit(PracticeListState.data(tracks));
    await cache();
  }

  @override
  PracticeListState fromJson(Map<String, dynamic> json) {
    return PracticeListState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PracticeListState state) {
    return state.toJson();
  }

  void dispose() {
    _firebaseLikedTracksSubscription?.cancel();
    _firebaseLikedTracksSubscription = null;
  }
}
