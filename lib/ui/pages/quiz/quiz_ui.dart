import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/common/utils/formula.dart';
import 'package:flutter_quiz/cubit/quiz/quiz_cubit.dart';
import 'package:flutter_quiz/cubit/quiz_answer/quiz_answer_cubit.dart';
import 'package:flutter_quiz/data/models/quiz_answer.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_one_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_two_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_three_ui.dart';

import '../../../data/local/shared_preferences_data.dart';
import '../../../data/models/quiz.dart';
import '../result/result_ui.dart';

class QuizUi extends StatefulWidget {
  const QuizUi({super.key});

  @override
  State<QuizUi> createState() => _QuizUiState();
}

class _QuizUiState extends State<QuizUi> {
  @override
  void initState() {
    context.read<QuizCubit>().loadQuiz();
    super.initState();
  }

  List<Quiz> listQuiz = [];

  int currentQuiz = 0;

  void nextQuiz(Quiz quiz, bool isFinish) async {
    listQuiz.add(quiz);
    if (isFinish) {
      final user = FirebaseAuth.instance.currentUser!;
      final resiko = Formula.resultResiko(
          listQuiz.map((e) => int.parse(e.score)).toList());
      final quizAnswer = QuizAnswerModel(
        accountId: user.uid,
        quiz: listQuiz,
      );
      await SharedPreferencesData.saveResiko(resiko);
      await SharedPreferencesData.saveQuizAnswer(quizAnswer);
      context.read<QuizAnswerCubit>().addQuizAnswer(
            user.uid,
            quizAnswer,
          );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const ResultPage();
      }));
    } else {
      setState(() {
        currentQuiz++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (state) {
            if (state.listQuiz.length > currentQuiz) {
              if (state.listQuiz[currentQuiz].type == '1') {
                return QuizTypeOnePage(
                  quiz: state.listQuiz[currentQuiz],
                  nextQuiz: nextQuiz,
                  noQuiz: currentQuiz + 1,
                  totalQuiz: state.listQuiz.length,
                );
              }
              if (state.listQuiz[currentQuiz].type == '2') {
                return QuizTypeTwoPage(
                  quiz: state.listQuiz[currentQuiz],
                  nextQuiz: nextQuiz,
                  noQuiz: currentQuiz + 1,
                  totalQuiz: state.listQuiz.length,
                );
              }
              if (state.listQuiz[currentQuiz].type == '3') {
                return QuizTypeThreePage(
                  quiz: state.listQuiz[currentQuiz],
                  nextQuiz: nextQuiz,
                  noQuiz: currentQuiz + 1,
                  totalQuiz: state.listQuiz.length,
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
