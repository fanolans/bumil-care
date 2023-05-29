import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/models/education.dart';

class EducationImageContainer extends StatelessWidget {
  const EducationImageContainer({
    Key? key,
    required this.education,
    this.height = 125,
    this.borderRadius = 20,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
  }) : super(key: key);

  final Education education;
  final double width;
  final double height;
  final double borderRadius;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(education.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
