import 'package:breathe_with_me/features/premium/models/premium_paywall_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

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
    final subscriptions =
        await _subscriptionsManager.getProducts() as Map<String, QProduct>;
    final configSubscriptions =
        _remoteConfigRepository.premium.paywall.subscriptions.toSet();

    if (configSubscriptions.isNotEmpty) {
      subscriptions
          .removeWhere((key, value) => !configSubscriptions.contains(key));
    }

    emit(
      PremiumPaywallState.data(
        subscriptions: subscriptions,
        selectedSubscriptionId:
            subscriptions.entries.firstOrNull?.value.qonversionId,
      ),
    );
  }

  void onSubscriptionSelected(String id) => emit(
        state.maybeMap(
          data: (state) => PremiumPaywallState.data(
            subscriptions: state.subscriptions,
            selectedSubscriptionId: id,
          ),
          orElse: () => state,
        ),
      );

  void onBuyPremium() {
    state.mapOrNull(
      data: (state) async {
        if (state.selectedSubscriptionId != null) {
          emit(state.copyWith(premiumPurchaseProcessing: true));
          try {
            await _subscriptionsManager.purchase(state.selectedSubscriptionId!);
          } on QPurchaseException catch (_, __) {
            // TODO(vasidmi): handle error
          } finally {
            emit(state.copyWith(premiumPurchaseProcessing: false));
          }
        }
      },
    );
  }

  void onClosePaywall() => _navigationManager.pop();
}
