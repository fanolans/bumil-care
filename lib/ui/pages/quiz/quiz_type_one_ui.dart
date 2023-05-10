import 'package:flutter/material.dart';

import '../../../common/constant/string_constant.dart';
import '../../../common/utils/formula.dart';
import '../../../data/models/quiz.dart';
import '../../widget/appbar.dart';
import 'components/quiz_ui_answer.dart';
import 'components/quiz_ui_button.dart';
import 'components/quiz_ui_content.dart';
import 'components/quiz_ui_image.dart';
import 'components/quiz_ui_list_of_question.dart';
import 'components/quiz_ui_title.dart';

class QuizTypeOnePage extends StatelessWidget {
  const QuizTypeOnePage({
    Key? key,
    required this.quiz,
    required this.nextQuiz,
    required this.noQuiz,
    required this.totalQuiz,
  }) : super(key: key);

  final Quiz quiz;
  final Function(Quiz, bool) nextQuiz;
  final int noQuiz;
  final int totalQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarDefault(
        title: 'Quiz',
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QuizImage(
                      imgPath: quiz.imageUrl,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                    QuizTitle(
                      title: quiz.title,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 36,
                    ),
                    QuizContent(
                      title: quiz.content,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          QuizAnswer(
            quizAnswerTitle: StringConstant.quizTitle,
            quizAnswerProgress: '$noQuiz/$totalQuiz',
          ),
          const SizedBox(
            height: 12,
          ),
          QuizListOfQuestion(
            question: quiz.quiz,
          ),
        ],
      ),
      bottomNavigationBar: QuizBottomNavbar(
        quizOnPressedYes: () {
          nextQuiz(
            quiz.copyWith(
                answer: 'Y',
                score: quiz.title == 'Hipertensi kronis'
                    ? Formula.hipertensiScore('Y').toString()
                    : '1'),
            noQuiz == totalQuiz,
          );
        },
        quizOnPressedNo: () {
          nextQuiz(
            quiz.copyWith(answer: 'N', score: '0'),
            noQuiz == totalQuiz,
          );
        },
      ),
    );
  }
}
