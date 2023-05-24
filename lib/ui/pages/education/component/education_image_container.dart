import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/models/education.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.education,
    required this.height,
    this.borderRadius = 20,
    required this.width,
    required this.imageUrl,
    required this.padding,
    required this.margin,
    required this.child,
  }) : super(key: key);

  final Education education;
  final double width;
  final double height;
  final double borderRadius;
  final String imageUrl;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(education.imageUrl), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
