import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';

import '../../data/models/education.dart';

part 'education_cubit.freezed.dart';
part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final FirebaseDatabaseDatasource _datasource;
  EducationCubit(
    this._datasource,
  ) : super(const EducationState.initial());

  void loadQuiz() async {
    try {
      emit(const EducationState.loading());
      final listEducation = await _datasource.getQuizTemplate();
      emit(EducationState.loaded(listEducation.cast<Education>()));
    } catch (e) {
      emit(const EducationState.error());
    }
  }
}
