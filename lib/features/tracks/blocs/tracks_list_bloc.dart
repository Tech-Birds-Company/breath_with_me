import 'dart:async';

import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class TracksListBloc extends CacheableBloc<TracksListState> {
  final TracksRepository _tracksRepository;

  TracksListBloc(this._tracksRepository)
      : super(const TracksListState.loading());

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
    emit(TracksListState.data(tracks));
    await cache();
  }

  @override
  TracksListState fromJson(Map<String, dynamic> json) =>
      TracksListState.fromJson(json);

  @override
  Map<String, dynamic> toJson(TracksListState state) => state.toJson();

  void dispose() {
    _firebaseLikedTracksSubscription?.cancel();
    _firebaseLikedTracksSubscription = null;
  }
}
