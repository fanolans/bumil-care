import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_quiz/common/constant/string_constant.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_answer.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_content.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_image.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_input_numbers_form.dart';
import 'package:flutter_quiz/ui/pages/quiz/components/quiz_ui_title.dart';
import 'package:flutter_quiz/ui/widget/appbar.dart';
import 'package:flutter_quiz/ui/widget/button.dart';

import '../../../common/utils/formula.dart';
import '../../../data/models/quiz.dart';

class QuizTypeThreePage extends StatefulWidget {
  const QuizTypeThreePage({
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
  State<QuizTypeThreePage> createState() => _QuizTypeThreePageState();
}

class _QuizTypeThreePageState extends State<QuizTypeThreePage> {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  final TextEditingController sisController = TextEditingController();
  final TextEditingController diaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.quiz2Title,
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
                      height: MediaQuery.of(context).size.height / 24,
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
                Column(
                  children: [
                    const Text(
                      StringConstant.quiz2Flavor,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 12,
                            ),
                            child: QuizInputNumber(
                              hintText: '120',
                              name: 'sistolik',
                              controller: sisController,
                              // validator: FormBuilderValidators.required(),
                            ),
                          ),
                        ),
                        const Text(
                          '/',
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.black54,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 12,
                            ),
                            child: QuizInputNumber(
                              hintText: '80',
                              name: 'diastolik',
                              controller: diaController,
                              // validator: FormBuilderValidators.required(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text(
                      StringConstant.quiz2Subtitile,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FleetimeButton(
        text: 'Selesai',
        onPressed: () {
          if (sisController.text.isNotEmpty && diaController.text.isNotEmpty) {
            widget.nextQuiz(
              widget.quiz.copyWith(
                  answer: '${sisController.text}/${diaController.text}',
                  score:
                      '${Formula.mapScore(int.parse(sisController.text), int.parse(diaController.text))}'),
              widget.totalQuiz == widget.noQuiz,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Harap isi semua field'),
              ),
            );
          }
        },
      ),
    );
  }
}
