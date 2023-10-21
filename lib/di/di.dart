import 'package:breathe_with_me/features/practices/blocs/practice_list_bloc.dart';
import 'package:breathe_with_me/features/practices/repositories/tracks_repository.dart';
import 'package:breathe_with_me/features/practices/repositories/tutor_repository.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/track_player_manager.dart';
import 'package:breathe_with_me/managers/download_manager/tracks_downloader_manger.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class _Manager {
  late final tracksDownloader = Provider((ref) {
    final manager = TracksDownloaderManager();
    ref.onDispose(manager.dispose);
    return manager;
  });

  late final trackPlayer =
      Provider.family<TrackPlayerManager, String>((ref, trackId) {
    final manager = TrackPlayerManager();
    ref.onDispose(manager.dispose);
    return manager;
  });

  late final navigation = Provider((ref) => NavigationManager());
}

final class _Bloc {
  late final practiceList = Provider(
    (ref) => PracticeListCubit(
      ref.read(Di.manager.navigation),
      ref.read(Di.repository.tracks),
    ),
  );

  late final trackPlayer = Provider.family<TrackPlayerCubit, String>(
    (ref, trackId) {
      final bloc = TrackPlayerCubit(
        trackId,
        ref.read(Di.manager.trackPlayer(trackId)),
        ref.read(Di.repository.tracks),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );
}

final class _Repository {
  late final tracks = Provider.autoDispose(
    (ref) => TracksRepository(
      ref.read(Di.repository.tutor),
    ),
  );

  late final tutor = Provider.autoDispose((ref) => const TutorRepository());
}

final class Di {
  const Di._();

  static final manager = _Manager();
  static final bloc = _Bloc();
  static final repository = _Repository();
}
