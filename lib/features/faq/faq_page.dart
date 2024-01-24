import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/faq/blocs/faq_bloc.dart';
import 'package:breathe_with_me/features/faq/models/faq_state.dart';
import 'package:breathe_with_me/features/faq/widgets/faq_question_list.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FaqPage extends ConsumerWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.bloc.faq);
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final currentLocale = EasyLocalization.of(context)!.locale;
    bloc.loadQuestions(currentLocale.languageCode);

    return Scaffold(
      backgroundColor: theme.darkBackground,
      appBar: BWMAppBar(
        title: LocaleKeys.profileFaqTitle.tr(),
        backgroundColor: theme.darkBackground,
      ),
      body: BlocBuilder<FaqBloc, FaqState>(
        bloc: bloc,
        builder: (context, state) => state.when(
          data: (questions) => FaqQuestionList(questions: questions),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: theme.secondaryColor,
            ),
          ),
          error: () => Center(
            child: Text(
              LocaleKeys.networkErrorText.tr(),
              style: theme.typography.bodyMTrue.copyWith(
                color: theme.gray4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
