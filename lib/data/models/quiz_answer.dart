import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_quiz/data/models/quiz.dart';

class QuizAnswerModel {
  final String accountId;
  final List<Quiz> quiz;
  QuizAnswerModel({
    required this.accountId,
    required this.quiz,
  });

  QuizAnswerModel copyWith({
    String? accountId,
    List<Quiz>? quiz,
  }) {
    return QuizAnswerModel(
      accountId: accountId ?? this.accountId,
      quiz: quiz ?? this.quiz,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'quiz': quiz.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizAnswerModel.fromMap(Map<String, dynamic> map) {
    return QuizAnswerModel(
      accountId: map['accountId'] ?? '',
      quiz: List<Quiz>.from(map['quiz']?.map((x) => Quiz.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizAnswerModel.fromJson(String source) => QuizAnswerModel.fromMap(json.decode(source));

  @override
  String toString() => 'QuizAnswerModel(accountId: $accountId, quiz: $quiz)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizAnswerModel &&
      other.accountId == accountId &&
      listEquals(other.quiz, quiz);
  }

  @override
  int get hashCode => accountId.hashCode ^ quiz.hashCode;
}
