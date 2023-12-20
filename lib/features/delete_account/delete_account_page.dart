import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteAccountPage extends ConsumerWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final currentLocale = EasyLocalization.of(context)!.locale;
    final bloc = ref.read(Di.shared.bloc.deleteAccount);
    return Scaffold(
        backgroundColor: theme.primaryBackground,
        body: SizedBox(
          height: 100,
          width: 100,
        ));
  }
}
