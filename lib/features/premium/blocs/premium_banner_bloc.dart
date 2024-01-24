import 'package:breathe_with_me/features/premium/models/premium_banner_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PremiumBannerBloc extends BlocBase<PremiumBannerState> {
  final RemoteConfigRepository _remoteConfigRepository;
  final SubscriptionsManager _subscriptionsManager;
  final NavigationManager _navigationManager;

  PremiumBannerBloc(
    this._remoteConfigRepository,
    this._subscriptionsManager,
    this._navigationManager,
  ) : super(const PremiumBannerState());

  bool get premiumBannerEnabled {
    final premiumEnabled = _subscriptionsManager.premiumEnabled;
    if (premiumEnabled) {
      return false;
    }
    return state.premiumBannerTracksEnabled &&
        !state.premiumBannerTracksWasHidden;
  }

  void init() {
    final config = _remoteConfigRepository.premium;
    emit(
      state.copyWith(
        premiumBannerTracksEnabled: config.premiumBannerTracksEnabled,
        premiumBannerTracksPosition: config.premiumBannerTracksPosition,
      ),
    );
  }

  void onUserHidePremiumBanner() => emit(
        state.copyWith(
          premiumBannerTracksWasHidden: true,
        ),
      );

  void onUserLearnMoreAboutPremium() {
    _navigationManager.openPremiumPaywall();
  }
}
