import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';

import '../../data/models/quiz.dart';

part 'quiz_cubit.freezed.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final FirebaseDatabaseDatasource _datasource;
  QuizCubit(
    this._datasource,
  ) : super(const QuizState.initial());

  void loadQuiz() async {
    try {
      emit(const QuizState.loading());
      final listQuiz = await _datasource.getQuizTemplate();
      emit(QuizState.loaded(listQuiz));
    } catch (e) {
      emit(const QuizState.error());
    }
  }
}
