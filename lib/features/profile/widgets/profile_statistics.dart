import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:flutter/material.dart';

class ProfileStatistics extends StatelessWidget {
  final StreakBloc bloc;
  final VoidCallback onPremiumButtonPressed;

  const ProfileStatistics({
    required this.bloc,
    required this.onPremiumButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
    // return BlocBuilder<StreakBloc, StreakState>(
    //   bloc: bloc,
    //   builder: (context, state) {
    //     return state.contentState.when(
    //       empty: () => const SizedBox.shrink(),
    //       premiumOffer: () => Padding(
    //         padding: const EdgeInsets.only(top: 32),
    //         child: DecoratedBox(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(12),
    //             color: const Color(0xFF111112),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(16),
    //             child: Column(
    //               children: [
    //                 for (final offer in PremiumConstants.premiumOffers)
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 3),
    //                     child: Row(
    //                       children: [
    //                         SvgPicture.asset(
    //                           BWMAssets.checkmark,
    //                           height: 16,
    //                           width: 16,
    //                           colorFilter: ColorFilter.mode(
    //                             theme.primaryText,
    //                             BlendMode.srcIn,
    //                           ),
    //                         ),
    //                         const SizedBox(width: 10),
    //                         Expanded(
    //                           child: Text(
    //                             offer.tr(),
    //                             maxLines: 2,
    //                             style: theme.typography.bodyS
    //                                 .copyWith(color: theme.primaryText),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 const SizedBox(height: 20),
    //                 BWMActionButton(
    //                   title: LocaleKeys.profilePremiumOfferButton.tr(),
    //                   width: double.infinity,
    //                   height: 40,
    //                   onPressed: onPremiumButtonPressed,
    //                   textColor: theme.purple2,
    //                   borderColor: theme.purple2,
    //                   overlayColor: theme.purple2.withAlpha(20),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       streakStatistics: (streaksStatistics) {
    //         return Padding(
    //           padding: const EdgeInsets.only(top: 32),
    //           child: DecoratedBox(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               color: const Color(0xFF111112),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(16),
    //               child: StreakStatistics(data: streaksStatistics),
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
