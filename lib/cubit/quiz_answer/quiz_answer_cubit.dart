import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';

import '../../data/models/quiz_answer.dart';

part 'quiz_answer_cubit.freezed.dart';
part 'quiz_answer_state.dart';

class QuizAnswerCubit extends Cubit<QuizAnswerState> {
  QuizAnswerCubit(
    this._datasource,
  ) : super(const QuizAnswerState.initial());
  final FirebaseDatabaseDatasource _datasource;

  void addQuizAnswer(String accountId, QuizAnswerModel quiz) async {
    try {
      emit(const QuizAnswerState.loading());
      _datasource.addQuizAnswer(accountId, quiz);
      emit(QuizAnswerState.loaded(quiz));
    } catch (e) {
      emit(QuizAnswerState.error(e.toString()));
    }
  }
}
