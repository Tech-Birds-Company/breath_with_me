import 'dart:async';

import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
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
    _filtersSubscription ??= Rx.combineLatest3(
      _tracksFiltersBloc.stream
          .map(
            (state) => state.copyWith(
              selectingCategory: false,
              selectingLanguage: false,
            ),
          )
          .distinct(),
      stream.distinct(),
      _tracksRepository.likedTracksStream,
      (
        filtersState,
        tracksState,
        likedTracks,
      ) =>
          (
        filtersState,
        tracksState,
        likedTracks,
      ),
    ).listen(_applyFilter);

    state.maybeWhen(
      data: (tracks, _) {
        emit(
          TracksListState.data(tracks, filteredTracks: tracks),
        );
      },
      orElse: () {},
    );

    await _loadTracks();
  }

  void _applyFilter((TracksFiltersState, TracksListState?, Set<String>) event) {
    final (filtersState, tracksState, likedTracks) = event;
    tracksState?.maybeWhen(
      data: (tracks, _) {
        final filteredTracks = tracks.where(
          (track) {
            final trackIsLiked = likedTracks.contains(track.id);
            final isLikedFilter = filtersState.likedTracksOnly;
            final selectedCategory = filtersState.selectedCategoryKey;
            final selectedLanguage = filtersState.selectedLanguageKey;

            if (isLikedFilter && !trackIsLiked) {
              return false;
            }

            if (selectedCategory == null && selectedLanguage == null) {
              return true;
            }

            if (selectedCategory != null && selectedLanguage != null) {
              return track.categoryKey == selectedCategory &&
                  track.language.name == selectedLanguage;
            }

            if (selectedCategory != null) {
              return track.categoryKey == selectedCategory;
            }

            if (selectedLanguage != null) {
              return track.language.name == selectedLanguage;
            }

            return true;
          },
        ).toList();
        emit(
          TracksListState.data(
            tracks,
            filteredTracks: filteredTracks,
          ),
        );
      },
      orElse: () {},
    );
  }

  Future<void> _syncLikedTracks(List<String> likedTracksFromFirebase) =>
      _tracksRepository.cacheLikedTracks(likedTracksFromFirebase);

  Future<void> _loadTracks() async {
    final tracks = await _tracksRepository.getTracks();
    final trackIds = tracks.map((e) => e.id).toString();
    BWMAnalytics.event('onTracksLoaded', params: {'tracks': trackIds});
    final filteredTracks = state.maybeWhen(
      data: (_, filteredTracks) => filteredTracks,
      orElse: () => <Track>[],
    );
    emit(
      TracksListState.data(
        tracks,
        filteredTracks: filteredTracks,
      ),
    );
    await cache();
  }

  @override
  TracksListState fromJson(Map<String, dynamic> json) =>
      TracksListState.fromJson(json);

  @override
  Map<String, dynamic> toJson(TracksListState state) => state.maybeWhen(
        data: (tracks, __) => TracksListStateData(tracks).toJson(),
        orElse: () => state.toJson(),
      );

  void dispose() {
    _firebaseLikedTracksSubscription?.cancel();
    _filtersSubscription?.cancel();
    _filtersSubscription = null;
    _firebaseLikedTracksSubscription = null;
  }
}
