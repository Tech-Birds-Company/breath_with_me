import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/store_product.dart';
import 'package:breathe_with_me/features/premium/blocs/premium_paywall_bloc.dart';
import 'package:breathe_with_me/features/premium/models/premium_paywall_state.dart';
import 'package:breathe_with_me/features/premium/premium_constants.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_badge.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_paywall/premium_paywall_buy_button.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_paywall/premium_paywall_tariff.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PremiumPaywall extends ConsumerWidget {
  final double topInset;

  const PremiumPaywall({
    this.topInset = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.premiumPaywall);
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
                    BlocSelector<PremiumPaywallBloc, PremiumPaywallState, bool>(
                      bloc: bloc,
                      selector: (state) => !state.premiumPurchaseProcessing,
                      builder: (context, isVisible) {
                        return isVisible
                            ? Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: theme.primaryColor,
                                  ),
                                  splashRadius: 20,
                                  onPressed: bloc.onClosePaywall,
                                ),
                              )
                            : const SizedBox.shrink();
                      },
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
                Expanded(
                  child: BlocBuilder<PremiumPaywallBloc, PremiumPaywallState>(
                    bloc: bloc,
                    builder: (context, state) {
                      final products =
                          state.storeProducts.values.whereNotNull();
                      return products.isEmpty
                          ? Center(
                              child: CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.purple2,
                                ),
                                backgroundColor: theme.primaryBackground,
                              ),
                            )
                          : Column(
                              children: [
                                for (final product in products)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: PremiumPaywallProduct(
                                      productId: product.identifier,
                                      title: product.localizedTitleKey.tr(),
                                      price: product.priceString,
                                      onPressed: bloc.onSubscriptionSelected,
                                      selected: state.selectedSubscriptionId ==
                                          product.identifier,
                                    ),
                                  ),
                              ],
                            );
                    },
                  ),
                ),
                BlocBuilder<PremiumPaywallBloc, PremiumPaywallState>(
                  bloc: bloc,
                  builder: (context, state) => PremiumPaywallButton(
                    isProcessing: state.premiumPurchaseProcessing,
                    onPressed: bloc.onBuyPremium,
                    isDisabled: state.storeProducts.isEmpty ||
                        state.selectedSubscriptionId == null,
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
