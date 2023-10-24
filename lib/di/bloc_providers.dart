part of 'di.dart';

final class _BlocProviders {
  late final practiceList = Provider(
    (ref) => PracticeListBloc(
      ref.read(Di.shared.manager.navigation),
      ref.read(Di.shared.repository.tracks),
      ref.read(Di.shared.manager.tracksDownloader),
    ),
  );

  late final trackPlayer = Provider.family<TrackPlayerBloc, String>(
    (ref, trackId) {
      final bloc = TrackPlayerBloc(
        trackId,
        ref.read(Di.shared.repository.tracks),
        ref.read(Di.shared.manager.trackPlayer(trackId)),
        ref.read(Di.shared.manager.tracksDownloader),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );
}
