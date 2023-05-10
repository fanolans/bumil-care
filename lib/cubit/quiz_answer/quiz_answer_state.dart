part of 'quiz_answer_cubit.dart';

@freezed
class QuizAnswerState with _$QuizAnswerState {
  const factory QuizAnswerState.initial() = _Initial;
  const factory QuizAnswerState.loading() = _Loading;
  const factory QuizAnswerState.loaded(QuizAnswerModel quizAnswer) = _Loaded;
  const factory QuizAnswerState.error(String message) = _Error;
}
