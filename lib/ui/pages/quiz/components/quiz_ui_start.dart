import 'package:flutter/material.dart';

import '../../../../common/constant/assets_constant.dart';
import '../../../../common/constant/string_constant.dart';
import '../../../widget/appbar.dart';
import '../quiz_ui.dart';

class QuizStart extends StatelessWidget {
  const QuizStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.quizTitle,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                '${assetImages}intro-1.png',
                fit: BoxFit.cover,
              ),
              const Text(
                'Preeklampsia awitan dini merupakan kehamilan yang disertai dengan tekanan darah >140/90 mmHg dan proteinuria atau hasil pemeriksaan lab yang tidak normal (trombositopenia, gangguan fungsi hati, nyeri pada daerah dada kanan atau nyeri epigastrium) pada usia kehamilan di atas 20 minggu sd kurang dari 34 minggu',
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10,
          vertical: MediaQuery.of(context).size.height / 20,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const QuizUi();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
              MediaQuery.of(context).size.width / 1.5,
              MediaQuery.of(context).size.height / 15,
            ),
          ),
          child: Text(
            'Mulai Skrining',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
