part of 'di.dart';

final class _BlocProviders {
  late final practiceList = Provider(
    (ref) => PracticeListBloc(
      ref.read(Di.manager.navigation),
      ref.read(Di.repository.tracks),
      ref.read(Di.manager.tracksDownloader),
    ),
  );

  late final trackPlayer = Provider.family<TrackPlayerBloc, String>(
    (ref, trackId) {
      final bloc = TrackPlayerBloc(
        trackId,
        ref.read(Di.repository.tracks),
        ref.read(Di.manager.trackPlayer(trackId)),
        ref.read(Di.manager.tracksDownloader),
      );
      ref.onDispose(bloc.dispose);
      return bloc;
    },
  );
}
