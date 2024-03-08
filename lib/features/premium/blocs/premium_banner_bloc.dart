import 'dart:async';

import 'package:breathe_with_me/features/premium/models/premium_banner_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/premium_manager/premium_manager.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PremiumBannerBloc extends BlocBase<PremiumBannerState> {
  final PremiumManager _premiumManager;
  final RemoteConfigRepository _remoteConfigRepository;
  final NavigationManager _navigationManager;

  PremiumBannerBloc(
    this._premiumManager,
    this._remoteConfigRepository,
    this._navigationManager,
  ) : super(const PremiumBannerState());

  StreamSubscription<bool>? _isUserPremiumSubscription;

  void init() {
    final config = _remoteConfigRepository.premiumV2;
    emit(
      state.copyWith(
        premiumBannerTracksEnabled: config.premiumBannerTracksEnabled,
        premiumBannerTracksPosition: config.premiumBannerTracksPosition,
        isPremiumUser: _premiumManager.isUserPremium,
        premiumContentEnabled: _premiumManager.premiumContentEnabled,
      ),
    );
    _setupIsUserPremiumSubscription();
  }

  void _setupIsUserPremiumSubscription() =>
      _isUserPremiumSubscription ??= _premiumManager.isPremiumUserStream.listen(
        (isPremiumUser) => emit(
          state.copyWith(isPremiumUser: isPremiumUser),
        ),
      );

  void onUserHidePremiumBanner() => emit(
        state.copyWith(
          premiumBannerTracksWasHidden: true,
        ),
      );

  Future<void> onUserLearnMoreAboutPremium() async {
    await _navigationManager.openPremiumPaywall();
  }

  void dispose() {
    _isUserPremiumSubscription?.cancel();
    _isUserPremiumSubscription = null;
  }
}
