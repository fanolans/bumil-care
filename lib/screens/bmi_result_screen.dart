import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  const BMIResultScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.recommendation,
  });

  final String bmiResult;
  final String resultText;
  final String recommendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Hasil BMI',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Hasil Perhitungan BMI',
            textAlign: TextAlign.center,
          ),
          Text(
            resultText.toUpperCase(),
            textAlign: TextAlign.center,
          ),
          Text(
            bmiResult,
            textAlign: TextAlign.center,
          ),
          Text(
            recommendation,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
