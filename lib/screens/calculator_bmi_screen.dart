import 'package:flutter/material.dart';

class CalculatorBMIScreen extends StatefulWidget {
  const CalculatorBMIScreen({super.key});

  @override
  State<CalculatorBMIScreen> createState() => _CalculatorBMIScreenState();
}

class _CalculatorBMIScreenState extends State<CalculatorBMIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
