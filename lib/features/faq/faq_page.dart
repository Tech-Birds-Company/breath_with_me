import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/faq/blocs/faq_block.dart';
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
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.faq);
    final currentLocale = EasyLocalization.of(context)!.locale;
    bloc.loadQuestions(currentLocale.languageCode);

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      appBar: BWMAppBar(title: LocaleKeys.profileFaqTitle.tr()),
      body: BlocBuilder<FaqBloc, FaqState>(
        bloc: bloc,
        builder: (context, state) => state.when(
          data: (questions) => FaqQuestionList(questions: questions),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: () {
            // TODO(bestK1ngArthur): Show error widget
            return const Text('Error');
          },
        ),
      ),
    );
  }
}
