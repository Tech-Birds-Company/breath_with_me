library di;

import 'package:breathe_with_me/features/onboarding/blocs/onboarding_bloc.dart';
import 'package:breathe_with_me/features/practices/blocs/practice_list_bloc.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/managers/audio_manager/track_audio_manger.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/download_manager/tracks_downloader_manger.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/player_manager/track_player_manager.dart';
import 'package:breathe_with_me/managers/user_manager/firebase_user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_tracks_repository.dart';
import 'package:breathe_with_me/repositories/firebase_tutors_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'bloc_providers.dart';
part 'manager_providers.dart';
part 'repository_providers.dart';

final class Di {
  Di._();

  static final shared = Di._();

  late final manager = _ManagerProviders();
  late final bloc = _BlocProviders();
  late final repository = _RepositoryProviders();
}