import 'dart:ui';

import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/delete_account/blocs/delete_account_bloc.dart';
import 'package:breathe_with_me/features/delete_account/model/delete_account_state.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteAccountPage extends StatelessWidget {
  final DeleteAccountBloc bloc;

  const DeleteAccountPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: ColoredBox(
        color: Colors.black.withOpacity(0.4),
        child: SafeArea(
          child: Center(
            child: BlocSelector<DeleteAccountBloc, DeleteAccountState, bool>(
              bloc: bloc,
              selector: (state) => state.isDeletionSucceed,
              builder: (context, isDeletionSucceed) {
                if (isDeletionSucceed) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        BWMAssets.deleteAccountDarkenedIcon,
                        width: 88,
                        height: 88,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 97),
                        child: Text(
                          LocaleKeys.deletedAccountTitle.tr(),
                          textAlign: TextAlign.center,
                          style: theme.typography.heading2.copyWith(
                            color: theme.primaryText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 24,
                        ),
                        child: Text(
                          LocaleKeys.deletedAccountDescription.tr(),
                          textAlign: TextAlign.center,
                          style: theme.typography.bodyMTrue.copyWith(
                            color: theme.primaryText,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0x24BDD6E9),
                        ),
                        onPressed: bloc.signOut,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65),
                          child: Text(
                            LocaleKeys.deletedAccountButton.tr(),
                            style: theme.typography.bodyMTrue.copyWith(
                              color: theme.primaryText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        BWMAssets.deleteAccountIcon,
                        width: 88,
                        height: 88,
                      ),
                      Text(
                        LocaleKeys.deleteAccountTitle.tr(),
                        style: theme.typography.heading2.copyWith(
                          color: theme.primaryText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 24),
                        child: Text(
                          LocaleKeys.deleteAccountDescription.tr(),
                          textAlign: TextAlign.center,
                          style: theme.typography.bodyMTrue.copyWith(
                            color: theme.primaryText,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0x24BDD6E9),
                        ),
                        onPressed: bloc.cancelDeleting,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65),
                          child: Text(
                            LocaleKeys.cancel.tr(),
                            style: theme.typography.bodyMTrue.copyWith(
                              color: theme.primaryText,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: bloc.deleteAccount,
                        child: Text(
                          LocaleKeys.deleteAccountButton.tr(),
                          style: theme.typography.bodyMTrue.copyWith(
                            color: theme.red,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
