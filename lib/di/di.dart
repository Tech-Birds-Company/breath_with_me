library di;

import 'package:breathe_with_me/features/faq/blocs/faq_bloc.dart';
import 'package:breathe_with_me/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:breathe_with_me/features/forgot_password/bloc/reset_password_bloc.dart';
import 'package:breathe_with_me/features/home/blocs/home_bloc.dart';
import 'package:breathe_with_me/features/onboarding/blocs/onboarding_bloc.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_paywall_bloc.dart';
import 'package:breathe_with_me/features/profile/blocs/profile_bloc.dart';
import 'package:breathe_with_me/features/profile_settings/bloc/profile_settings_bloc.dart';
import 'package:breathe_with_me/features/reminder/blocs/reminder_bloc.dart';
import 'package:breathe_with_me/features/safety_precautions/blocs/safety_precautions_bloc.dart';
import 'package:breathe_with_me/features/sign_in/blocs/signin_bloc.dart';
import 'package:breathe_with_me/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/track_player/blocs/track_player_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/track_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_filters_bloc.dart';
import 'package:breathe_with_me/features/tracks/blocs/tracks_list_bloc.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/download_manager/tracks_downloader_manger.dart';
import 'package:breathe_with_me/managers/link_handler_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/premium_manager/premium_manager.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/managers/user_manager/firebase_user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_faq_questions_repository.dart';
import 'package:breathe_with_me/repositories/firebase_premium_repository.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:breathe_with_me/repositories/firebase_tutors_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository_v2.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:breathe_with_me/repositories/tracks_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'bloc_providers.dart';
part 'manager_providers.dart';
part 'repository_providers.dart';

abstract final class Di {
  static final manager = _ManagerProviders();
  static final bloc = _BlocProviders();
  static final repository = _RepositoryProviders();
}
