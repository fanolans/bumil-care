import 'package:flutter/material.dart';

class HomeTopButton extends StatelessWidget {
  const HomeTopButton({
    super.key,
    required this.name,
    this.onPressed,
  });

  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        foregroundColor: Colors.red.shade200,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(
          double.infinity,
          MediaQuery.of(context).size.height / 15,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
