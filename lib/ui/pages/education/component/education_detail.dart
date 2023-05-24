import 'package:flutter/material.dart';

import '../../../../data/models/education.dart';
import 'education_image_container.dart';

class EducationDetail extends StatelessWidget {
  const EducationDetail({
    Key? key,
    required this.education,
  }) : super(key: key);

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Column(
              children: [
                ImageContainer(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  education: education,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  imageUrl: education.imageUrl,
                  child: const Text(''),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(
                  top: MediaQuery.of(context).size.height / 3),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      education.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
