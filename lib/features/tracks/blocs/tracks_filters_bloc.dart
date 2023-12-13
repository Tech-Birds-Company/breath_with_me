import 'package:breathe_with_me/features/tracks/models/tracks_filters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TracksFiltersBloc extends BlocBase<TracksFiltersState> {
  TracksFiltersBloc() : super(const TracksFiltersState());

  void onLikedTracksFilterToggle() => emit(
        state.copyWith(likedTracksOnly: !state.likedTracksOnly),
      );
}
