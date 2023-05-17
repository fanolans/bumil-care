import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_quiz/data/models/account.dart';
import 'package:flutter_quiz/data/models/education.dart';
import 'package:flutter_quiz/data/models/quiz_answer.dart';

import '../models/quiz.dart';

class FirebaseDatabaseDatasource {
  void addQuizTemplate(List<Quiz> listQuiz) {
    FirebaseDatabase.instance
        .ref()
        .child("quiz_template")
        .child('v1')
        .set(listQuiz.map((e) => e.toMap()).toList());
  }

  void addQuizAnswer(String accountId, QuizAnswerModel quiz) {
    FirebaseDatabase.instance
        .ref()
        .child("quiz_answers")
        .child(accountId)
        .set(quiz.toMap());
  }

  Future<List<Quiz>> getQuizTemplate() async {
    final listQuiz = <Quiz>[];
    final snapshot = await FirebaseDatabase.instance
        .ref()
        .child("quiz_template")
        .child('v1')
        .once();
    final data = snapshot.snapshot.value as List<Object?>;
    for (var item in data) {
      if (item is Map) {
        Map<String, dynamic> newMap = {};
        item.forEach((key, value) {
          if (key is String) {
            newMap[key] = value;
          }
        });
        listQuiz.add(Quiz.fromMap(newMap));
      }
    }

    return listQuiz;
  }

  Future<bool> getExistingUser(String id) async {
    final snapshot = await FirebaseDatabase.instance
        .ref()
        .child("accounts")
        .child(id)
        .once();
    final data = snapshot.snapshot.value;
    return data != null;
  }

  Future<Account> getAccount(String id) async {
    final snapshot = await FirebaseDatabase.instance
        .ref()
        .child("accounts")
        .child(id)
        .once();
    final data = snapshot.snapshot.value;
    Map<String, dynamic> newMap = {};
    if (data is Map) {
      data.forEach((key, value) {
        if (key is String) {
          newMap[key] = value;
        }
      });
    }
    return Account.fromMap(newMap);
  }

  Future<void> addAccount(String id, Map<String, dynamic> data) async {
    await FirebaseDatabase.instance.ref().child("accounts").child(id).set(data);
  }

  Future<void> updateAccount(String id, Account account) async {
    await FirebaseDatabase.instance
        .ref()
        .child("accounts")
        .child(id)
        .update(account.toMap());
  }

  Future<void> addQuizAnswerResult(String id, Map<String, dynamic> data) async {
    await FirebaseDatabase.instance
        .ref()
        .child("quiz_answers")
        .child(id)
        .child('result')
        .set(data);
  }

  Future<List<Education>> getEducations() async {
    final listEducation = <Education>[];
    final snapshot =
        await FirebaseDatabase.instance.ref().child("educations").once();
    final data = snapshot.snapshot.value as List<Object?>;
    for (var item in data) {
      if (item is Map) {
        Map<String, dynamic> newMap = {};
        item.forEach((key, value) {
          if (key is String) {
            newMap[key] = value;
          }
        });
        listEducation.add(Education.fromMap(newMap));
      }
    }

    return listEducation;
  }
}
