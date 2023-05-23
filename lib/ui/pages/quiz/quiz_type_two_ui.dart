import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_quiz/common/constant/string_constant.dart';
import 'package:flutter_quiz/common/utils/formula.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_answer.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_content.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_image.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_input_height_and_weight.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_title.dart';
import 'package:flutter_quiz/ui/widget/appbar.dart';
import 'package:flutter_quiz/ui/widget/button.dart';

import '../../../data/models/quiz.dart';

class QuizTypeTwoPage extends StatefulWidget {
  const QuizTypeTwoPage({
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
  State<QuizTypeTwoPage> createState() => _QuizTypeTwoPageState();
}

class _QuizTypeTwoPageState extends State<QuizTypeTwoPage> {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.quiz3Title,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: fbKey,
            child: Column(
              children: [
                Column(
                  children: [
                    QuizImage(
                      imgPath: widget.quiz.imageUrl,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                    QuizTitle(
                      title: widget.quiz.title,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 36,
                    ),
                    QuizContent(
                      title: widget.quiz.content,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 52,
                    ),
                  ],
                ),
                QuizAnswer(
                  quizAnswerTitle: StringConstant.quizTitle,
                  quizAnswerProgress: '${widget.noQuiz}/${widget.totalQuiz}',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 36,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12,
                  ),
                  child: Column(
                    children: [
                      QuizInputHeightAndWeight(
                        name: 'height',
                        hintText: 'Masukkan Tinggi Badan',
                        controller: heightController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 48,
                      ),
                      QuizInputHeightAndWeight(
                        name: 'weight',
                        hintText: 'Masukkan Berat Badan',
                        controller: weightController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 36,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FleetimeButton(
        text: 'Berikutnya',
        onPressed: () {
          if (heightController.text.isNotEmpty &&
              weightController.text.isNotEmpty) {
            widget.nextQuiz(
              widget.quiz.copyWith(
                answer:
                    'Tinggi: ${heightController.text}, Berat: ${weightController.text}',
                score:
                    '${Formula.obesitasScore(int.parse(heightController.text), int.parse(weightController.text))}',
              ),
              widget.noQuiz == widget.totalQuiz,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Mohon isi semua field'),
              ),
            );
          }
        },
      ),
    );
  }
}
