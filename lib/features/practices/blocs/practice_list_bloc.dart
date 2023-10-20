import 'package:breathe_with_me/features/practices/models/practice_list_state.dart';
import 'package:breathe_with_me/features/practices/repositories/tracks_repository.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PracticeListCubit extends Cubit<PracticeListState> {
  final NavigationManager _navigationManager;
  final TracksRepository _tracksRepository;

  PracticeListCubit(
    this._navigationManager,
    this._tracksRepository,
  ) : super(const PracticeListState());

  Future<void> loadTracks() async {
    final tracks = await _tracksRepository.getTracks();
    emit(state.copyWith(tracks: tracks));
  }

  void openTrackPlayer(String trackId) {
    _navigationManager.openTrackPlayer(trackId);
  }
}
