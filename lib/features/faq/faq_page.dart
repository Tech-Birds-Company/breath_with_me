import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/faq/blocks/faq_block.dart';
import 'package:breathe_with_me/features/faq/models/faq_state.dart';
import 'package:breathe_with_me/features/faq/widgets/faq_question_list.dart';
import 'package:breathe_with_me/features/profile/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FaqPage extends ConsumerWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.shared.bloc.faq);
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BlocBuilder<FaqBloc, FaqState>(
      bloc: bloc,
      builder: (context, state) {
        return state.when(
          data: (questions) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                backgroundColor: theme.primaryBackground,
                appBar: BWMAppBar(title: LocaleKeys.profileFaqTitle.tr()),
                body: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.primaryBackground,
                        Colors.black,
                      ],
                    ),
                  ),
                  child: FaqQuestionList(
                    questions: questions,
                  ),
                ),
              ),
            );
          },
          loading: () {
            return Text("Loading");
          },
          error: () {
            return Text("Error");
          },
        );
      },
    );
  }
}
