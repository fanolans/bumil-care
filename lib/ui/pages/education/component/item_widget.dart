import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../data/models/education.dart';
import 'education_detail.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.education,
  }) : super(key: key);
  final Education education;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EducationDetail(education: education),
            ),
          );
        },
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: Colors.white,
          child: SizedBox(
            width: 300,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.network(education.imageUrl),
                  Text(
                    education.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    education.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
