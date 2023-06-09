import 'package:flutter/material.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          height: 1.3,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
