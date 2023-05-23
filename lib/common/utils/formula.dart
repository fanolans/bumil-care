import 'dart:math';

class Formula {
  static int generalScore(String answer) {
    int score = 0;
    if (answer == 'Y') {
      score = 1;
    }
    return score;
  }

  static int hipertensiScore(String answer) {
    int score = 0;
    if (answer == 'Y') {
      score = 2;
    }
    return score;
  }

  static int obesitasScore(int tinggi, int berat) {
    int score = 0;
    double bmi = berat / pow(tinggi / 100, 2);
    if (bmi > 30) {
      return 2;
    }
    return score;
  }

  static int mapScore(int sistol, int diastol) {
    int score = 0;
    double map = (sistol + (diastol * 2)) / 3;
    if (map > 90) {
      score = 2;
    }
    return score;
  }

  static String resultResiko(List<int> listScore) {
    String result = 'Risiko Rendah';
    int totalScore = listScore.reduce((value, element) => value + element);
    if (totalScore > 0) {
      result = 'Risiko Tinggi';
    }
    return result;
  }
}
