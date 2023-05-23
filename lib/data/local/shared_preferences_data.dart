import 'package:flutter_quiz/data/models/account.dart';
import 'package:flutter_quiz/data/models/quiz_answer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  static Future<bool> saveResiko(String value) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setString('resiko', value);
  }

  static Future<String> getResiko() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString('resiko') ?? 'Belum ada hasil';
    return value;
  }

  static Future<bool> saveAccount(Account account) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setString('account', account.toJson());
  }

  static Future<Account> getAccount() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString('account') ?? '';
    return Account.fromJson(value);
  }

  static Future<bool> saveQuizAnswer(QuizAnswerModel quizAnswer) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setString('quizAnswer', quizAnswer.toJson());
  }

  static Future<QuizAnswerModel> getQuizAnswer() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString('quizAnswer') ?? '';
    return QuizAnswerModel.fromJson(value);
  }
}
