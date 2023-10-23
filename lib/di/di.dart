library di;

import 'package:breathe_with_me/features/practices/blocs/practice_list_bloc.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/track_player/track_player_manager.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/download_manager/tracks_downloader_manger.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/repositories/tutor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'bloc_providers.dart';
part 'manager_providers.dart';
part 'repository_providers.dart';

final class Di {
  const Di._();

  static final manager = _ManagerProviders();
  static final bloc = _BlocProviders();
  static final repository = _RepositoryProviders();
}
