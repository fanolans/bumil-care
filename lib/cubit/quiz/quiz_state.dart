part of 'quiz_cubit.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.initial() = _Initial;
  const factory QuizState.loading() = _Loading;
  const factory QuizState.loaded(List<Quiz> listQuiz) = _Loaded;
  const factory QuizState.error() = _Error;
}
