import 'package:breathe_with_me/features/premium/models/premium_paywall_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PremiumPaywallBloc extends BlocBase<PremiumPaywallState> {
  final SubscriptionsManager _subscriptionsManager;
  final RemoteConfigRepository _remoteConfigRepository;
  final NavigationManager _navigationManager;

  PremiumPaywallBloc(
    this._subscriptionsManager,
    this._remoteConfigRepository,
    this._navigationManager,
  ) : super(const PremiumPaywallState.loading());

  Future<void> init() async {
    final configSubscriptions =
        _remoteConfigRepository.premium.paywall.subscriptions;

    final subscriptions =
        await _subscriptionsManager.getProducts(configSubscriptions);

    if (configSubscriptions.isNotEmpty) {
      subscriptions
          .removeWhere((key, value) => !configSubscriptions.contains(key));
    }

    emit(
      PremiumPaywallState.data(
        subscriptions: subscriptions,
        selectedSubscriptionId:
            subscriptions.entries.firstOrNull?.value.identifier,
      ),
    );
  }

  void onSubscriptionSelected(String id) {
    if (state is! PremiumPaywallData) {
      return;
    } else {
      final currentState = state as PremiumPaywallData;
      if (currentState.premiumPurchaseProcessing) {
        return;
      }
    }
    emit(
      state.maybeMap(
        data: (state) => PremiumPaywallState.data(
          subscriptions: state.subscriptions,
          selectedSubscriptionId: id,
        ),
        orElse: () => state,
      ),
    );
  }

  void onBuyPremium() {
    state.mapOrNull(
      data: (state) async {
        if (state.selectedSubscriptionId != null) {
          emit(state.copyWith(premiumPurchaseProcessing: true));
          try {
            await _subscriptionsManager
                .purchase(state.subscriptions[state.selectedSubscriptionId]!);
          } on PlatformException {
            // TODO(vasidmi): handle error
          } finally {
            emit(state.copyWith(premiumPurchaseProcessing: false));
            _navigationManager.pop();
          }
        }
      },
    );
  }

  void onClosePaywall() => _navigationManager.pop();
}
