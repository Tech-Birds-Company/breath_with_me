import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/extensions/q_product_duration.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_paywall_bloc.dart';
import 'package:breathe_with_me/features/premium/models/premium_paywall_state.dart';
import 'package:breathe_with_me/features/premium/premium_constants.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_badge.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_paywall/premium_paywall_buy_button.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_paywall/premium_paywall_tariff.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class PremiumPaywall extends HookWidget {
  final double topInset;
  final PremiumPaywallBloc bloc;

  const PremiumPaywall({
    required this.bloc,
    this.topInset = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        bloc.init();
        return null;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const _PremiumPaywallGradient(),
          Padding(
            padding: EdgeInsets.only(
              top: topInset,
              left: 24,
              right: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      BWMAssets.logoIcon,
                      height: 53,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: theme.primaryColor,
                        ),
                        splashRadius: 20,
                        onPressed: bloc.onClosePaywall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PremiumBadge(
                  text: LocaleKeys.premium_premium.tr(),
                ),
                const SizedBox(height: 36),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final offer in PremiumConstants.premiumOffers)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              BWMAssets.checkmark,
                              height: 10,
                              width: 10,
                              colorFilter: ColorFilter.mode(
                                theme.purple2,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                offer.tr(),
                                style: theme.typography.bodyM.copyWith(
                                  color: theme.primaryText,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 36),
                Text(
                  LocaleKeys.premium_paywall_selectTariffTitle
                      .tr()
                      .toUpperCase(),
                  style: theme.typography.label.copyWith(
                    color: theme.gray3,
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<PremiumPaywallBloc, PremiumPaywallState>(
                  bloc: bloc,
                  builder: (context, state) => state.map(
                    data: (state) => Column(
                      children: state.subscriptions.entries
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: PremiumPaywallProduct(
                                productId: e.value.qonversionId,
                                title: e.value.duration.localizedDuration,
                                description: LocaleKeys
                                    .premium_paywall_trialDescription
                                    .tr(),
                                price: e.value.prettyPrice ?? '',
                                selected: e.value.qonversionId ==
                                    state.selectedSubscriptionId,
                                onPressed: bloc.onSubscriptionSelected,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    loading: (_) => const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    error: (_) => const SizedBox.shrink(),
                  ),
                ),
                const Spacer(),
                BlocBuilder<PremiumPaywallBloc, PremiumPaywallState>(
                  bloc: bloc,
                  builder: (context, state) => state.maybeMap(
                    data: (state) => PremiumPaywallButton(
                      onPressed: state.selectedSubscriptionId != null
                          ? bloc.onBuyPremium
                          : null,
                      isProcessing: state.premiumPurchaseProcessing,
                    ),
                    orElse: () => const PremiumPaywallButton(),
                    // onPressed: null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumPaywallGradient extends StatelessWidget {
  const _PremiumPaywallGradient();

  @override
  Widget build(BuildContext context) => const SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              focal: Alignment(0.8, -0.5),
              colors: [
                Color(0xE6463050), // TODO: Use color from theme
                Color(0xD7000000), // TODO: Use color from theme
                Color(0xFC100c0c), // TODO: Use color from theme
              ],
              radius: 1.5,
            ),
          ),
        ),
      );
}