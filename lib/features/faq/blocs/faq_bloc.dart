import 'package:breathe_with_me/features/faq/analytics/faq_analytics_constants.dart';
import 'package:breathe_with_me/features/faq/analytics/faq_analytics_event.dart';
import 'package:breathe_with_me/features/faq/models/faq_language.dart';
import 'package:breathe_with_me/features/faq/models/faq_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/repositories/faq_questions_repository.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class FaqBloc extends CacheableBloc<FaqState> {
  final FaqQuestionsRepository _questionsRepository;

  FaqBloc(this._questionsRepository) : super(const FaqState.loading());

  @override
  String get key => DatabaseCachedKeys.cachedFaqKey;

  Future<void> loadQuestions(String languageCode) async {
    BWMAnalytics.event(
      FaqAnalyticsEvent.faqLoadQuestions,
      params: {
        FaqAnalyticsConstants.languageCode: languageCode,
      },
    );
    final language = FaqLanguageHelper.fromCode(languageCode);
    final questions = await _questionsRepository.getQuestions(language);
    emit(FaqState.data(questions));
  }

  @override
  FaqState fromJson(Map<String, dynamic> json) => FaqState.fromJson(json);

  @override
  Map<String, dynamic> toJson(FaqState state) => state.toJson();
}
