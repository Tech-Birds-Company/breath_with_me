import 'dart:async';

import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';
import 'package:rxdart/rxdart.dart';

final class TracksListBloc extends CacheableBloc<TracksListState> {
  final TracksRepository _tracksRepository;
  final Stream<TracksFiltersState> _filtersStream;

  TracksListBloc(
    this._tracksRepository,
    this._filtersStream,
  ) : super(const TracksListState.loading());

  StreamSubscription<Set<String>>? _firebaseLikedTracksSubscription;
  StreamSubscription<(TracksFiltersState, TracksListState?, Set<String>)>?
      _filtersSubscription;

  Future<void> init() async {
    _firebaseLikedTracksSubscription ??=
        _tracksRepository.firebaseLikedTracksStream.listen(
      (event) => _syncLikedTracks(
        event.toList(),
      ),
    );
    _filtersSubscription ??= Rx.combineLatest3(_filtersStream,
        cachedBlocStateStream, _tracksRepository.likedTracksStream, (
      filtersState,
      tracksState,
      likedTracks,
    ) {
      return (filtersState, tracksState, likedTracks);
    }).listen(_applyFilter);
    await _loadTracks();
  }

  void _applyFilter((TracksFiltersState, TracksListState?, Set<String>) event) {
    final (filtersState, tracksState, likedTracks) = event;
    tracksState?.maybeWhen(
      data: (state) {
        final filteredTracks = state.where(
          (track) {
            final trackIsLiked = likedTracks.contains(track.id);
            final isLikedFilter = filtersState.likedTracksOnly;
            return (isLikedFilter && trackIsLiked) || (!isLikedFilter);
          },
        ).toList();
        emit(TracksListState.data(filteredTracks));
      },
      orElse: () {},
    );
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
    _filtersSubscription?.cancel();
    _filtersSubscription = null;
    _firebaseLikedTracksSubscription = null;
  }
}
