import 'dart:convert';

import 'package:fitlifebuddy/domain/model/feedback.dart';

class Question {
  String? id;
  String? name;
  Feedback? feedback;

  Question({
    this.id,
    this.name,
    this.feedback,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idQuestion': id,
      'nameQuestion': name,
      'feedback': feedback?.toJson(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['idQuestion'] != null ? map['idQuestion'] as String : null,
      name: map['nameQuestion'] != null ? map['nameQuestion'] as String: null,
      feedback: map['feedback'] != null ? Feedback.fromMap(map['feedback'] as Map<String, dynamic>): null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}