import 'package:flutter/material.dart';
import 'package:flutter_quiz/common/constant/string_constant.dart';
import 'package:flutter_quiz/data/local/shared_preferences_data.dart';
import 'package:flutter_quiz/data/models/quiz.dart';
import 'package:flutter_quiz/ui/pages/home/components/home_ui_top_button.dart';
import 'package:flutter_quiz/ui/pages/home/home_ui.dart';
import 'package:flutter_quiz/ui/widget/appbar.dart';
import 'package:flutter_quiz/ui/widget/button.dart';

import 'components/result_ui_expansion_tile.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isLoading = false;
  String resikoValue = '';
  List<Quiz> listQuiz = [];

  @override
  void initState() {
    isLoading = true;
    SharedPreferencesData.getResiko().then((resiko) {
      SharedPreferencesData.getQuizAnswer().then((value) {
        setState(() {
          resikoValue = resiko;
          listQuiz = value.quiz;
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.resultTitle,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTopButton(
                    name: resikoValue,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Text(
                    StringConstant.resultSubtitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 36,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: listQuiz.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: int.parse(listQuiz[index].score) > 0 ? 16 : 0,
                      ),
                      itemBuilder: (context, index) {
                        if (int.parse(listQuiz[index].score) > 0) {
                          return ResultExpansionTile(
                            title: listQuiz[index].title,
                            content: listQuiz[index].educations,
                            initiallyExpanded: false,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: FleetimeButton(
        text: 'Kembali ke Home',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
        },
      ),
    );
  }
}
