class BMICalculatorServices {
  var result = '';
  var description = '';

  bmiResult(weight, height) {
    double bmi = (weight / (height * height)) * 10000;
    if (bmi < 18.5) {
      result = 'Underweight';
      description = 'Anda memiliki berat badan Underweight';
    }
    if (bmi >= 18.5 && bmi < 25) {
      result = 'Normal';
      description = 'Anda memiliki berat badan Normal';
    }
    if (bmi > 25 && bmi <= 29.00) {
      result = 'Overweight';
      description = 'Anda memiliki berat badan Overweight';
    } else {
      result = 'Obesitas';
      description = 'Anda memiliki berat badan Obesitas';
    }
    return bmi.round();
  }
}
