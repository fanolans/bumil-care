import 'package:flutter/material.dart';

class QuizImage extends StatelessWidget {
  const QuizImage({
    super.key,
    required this.imgPath,
  });

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imgPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
