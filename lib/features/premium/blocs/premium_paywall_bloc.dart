import 'package:breathe_with_me/features/premium/models/premium_paywall_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PremiumPaywallBloc extends BlocBase<PremiumPaywallState> {
  final NavigationManager _navigationManager;

  PremiumPaywallBloc(
    this._navigationManager,
  ) : super(const PremiumPaywallState.loading());

  Future<void> init() async {}

  void onSubscriptionSelected(String id) {}

  void onBuyPremium() {}

  void onClosePaywall() => _navigationManager.pop();
}
