import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui/pages/education/component/education_ui_image_container.dart';

import '../../../../data/models/education.dart';
import 'education_ui_detail.dart';

class EducationList extends StatelessWidget {
  const EducationList({
    Key? key,
    required this.education,
  }) : super(key: key);
  final Education education;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EducationDetail(
                  education: education,
                ),
              ),
            );
          },
          child: Column(
            children: [
              EducationImageContainer(
                education: education,
                width: MediaQuery.of(context).size.width * 0.5,
                imageUrl: education.imageUrl,
              ),
              Text(
                education.title,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
