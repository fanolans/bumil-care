import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/models/education.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());

  void getEducations() async {
    emit(EducationLoading());
    final response = await http.get(
      Uri.parse(
          'https://quiz-care-default-rtdb.asia-southeast1.firebasedatabase.app/educations.json'),
    );
    emit(
      EducationSuccess(
        educations: educationFromJson(response.body),
      ),
    );
  }
}
