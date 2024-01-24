import 'dart:async';

import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';
import 'package:rxdart/rxdart.dart';

final class TracksListBloc extends CacheableBloc<TracksListState> {
  final TracksRepository _tracksRepository;
  final TracksFiltersBloc _tracksFiltersBloc;

  TracksListBloc(
    this._tracksRepository,
    this._tracksFiltersBloc,
  ) : super(const TracksListState.loading());

  @override
  String get key => DatabaseCachedKeys.cachedTracksKey;

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
    _filtersSubscription ??= Rx.combineLatest3(_tracksFiltersBloc.stream,
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
            final selectedCategory = filtersState.selectedCategoryKey;
            final selectedLanguage = filtersState.selectedLanguageKey;

            return (!isLikedFilter || trackIsLiked) &&
                (selectedCategory == null ||
                    track.categoryKey == selectedCategory) &&
                (selectedLanguage == null ||
                    track.language.name == selectedLanguage);
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
