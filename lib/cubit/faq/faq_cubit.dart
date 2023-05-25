import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/models/faq.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  void getFaq() async {
    emit(FaqLoading());
    final response = await http.get(
      Uri.parse(
          'https://quiz-care-default-rtdb.asia-southeast1.firebasedatabase.app/faq.json'),
    );
    emit(
      FaqSuccess(
        faqs: faqFromJson(response.body),
      ),
    );
  }
}
