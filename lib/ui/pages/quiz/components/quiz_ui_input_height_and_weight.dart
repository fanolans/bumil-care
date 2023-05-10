import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class QuizInputHeightAndWeight extends StatelessWidget {
  const QuizInputHeightAndWeight({
    super.key,
    required this.name,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String name;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14.0,
          color: Colors.black54,
          letterSpacing: 0.5,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
          ),
          child: Text(
            name == 'height' ? 'cm' : 'kg',
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
              letterSpacing: 0.5,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        filled: false,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade300,
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
            color: Colors.red.shade300,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
