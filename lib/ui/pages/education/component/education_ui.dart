import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/models/education.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key, required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listEducation.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(education.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(education.title),
              Text(
                education.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        );
      },
    );
  }
}
