import 'package:breathe_with_me/features/practices/models/practice_list_state.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PracticeListBloc extends BlocBase<PracticeListState> {
  final NavigationManager _navigationManager;
  final TracksRepository _tracksRepository;
  final DownloaderManager _downloadManager;

  PracticeListBloc(
    this._navigationManager,
    this._tracksRepository,
    this._downloadManager,
  ) : super(const PracticeListState());

  Stream<bool>? trackDownloadProgressStream(String trackId) {
    return _downloadManager
        .taskProgress(trackId)
        ?.map((progress) => progress == 1.0);
  }

  Future<void> loadTracks() async {
    final tracks = await _tracksRepository.getFirebaseTracks();
    emit(state.copyWith(tracks: tracks));
  }

  void openTrackPlayer(String trackId) {
    _navigationManager.openTrackPlayer(trackId);
  }
}
