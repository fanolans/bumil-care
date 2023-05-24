import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class QuizInputNumber extends StatelessWidget {
  const QuizInputNumber({
    super.key,
    required this.name,
    required this.hintText,
    this.validator,
    this.controller,
  });

  final String name;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: validator,
      style: const TextStyle(
        fontSize: 14.0,
        color: Colors.black,
        letterSpacing: 0.5,
      ),
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14.0,
          color: Colors.black54,
          letterSpacing: 0.5,
        ),
        filled: false,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade200,
            width: 5.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade200,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
