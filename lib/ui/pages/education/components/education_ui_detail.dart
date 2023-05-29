import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui/pages/education/components/education_ui_image_container.dart';
import 'package:flutter_quiz/ui/pages/education/education_ui.dart';

import '../../../../data/models/education.dart';

class EducationDetail extends StatelessWidget {
  const EducationDetail({
    Key? key,
    required this.education,
  }) : super(key: key);

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Expanded(
        child: Stack(
          children: [
            EducationImageContainer(
              education: education,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              imageUrl: education.imageUrl,
            ),
            Positioned(
              top: 225,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 40, right: 24, left: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
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
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Rekomendasi lain',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: const EducationPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 245),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
