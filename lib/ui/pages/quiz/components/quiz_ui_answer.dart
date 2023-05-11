import 'package:flutter/material.dart';

class QuizAnswer extends StatelessWidget {
  const QuizAnswer({
    super.key,
    required this.quizAnswerTitle,
    required this.quizAnswerProgress,
  });

  final String quizAnswerTitle;
  final String quizAnswerProgress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quizAnswerTitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            quizAnswerProgress,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
