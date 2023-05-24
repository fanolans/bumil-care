import 'package:flutter/material.dart';
import 'package:flutter_quiz/common/constant/string_constant.dart';
import 'package:flutter_quiz/data/local/shared_preferences_data.dart';
import 'package:flutter_quiz/data/models/quiz.dart';
import 'package:flutter_quiz/ui/pages/home/components/home_ui_top_button.dart';
import 'package:flutter_quiz/ui/pages/home/home_ui.dart';
import 'package:flutter_quiz/ui/widget/appbar.dart';
import 'package:flutter_quiz/ui/widget/button.dart';

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

class ResultExpansionTile extends StatelessWidget {
  const ResultExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded,
  });

  final String title;
  final List<String> content;
  final bool? initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded ?? false,
        iconColor: Colors.red.shade200,
        collapsedIconColor: Colors.red.shade200,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        children: [
          const ListTile(
            title: Text(
              'Sebaiknya anda menerapkan pola gaya hidup sehat berikut:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                height: 1.2,
              ),
            ),
          ),
          ...content.asMap().entries.map(
                (e) => ListTile(
                  minLeadingWidth: 10,
                  leading: Text(
                    '${e.key + 1}.',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    e.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
