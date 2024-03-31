import 'dart:convert';

import 'package:fitlifebuddy/domain/model/feedback.dart';
import 'package:fitlifebuddy/domain/model/option.dart';

class Question {
  String? id;
  String? name;
  Feedback? feedback;
  List<Option>? options;

  Question({
    this.id,
    this.name,
    this.feedback,
    this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': name,
      'feedback': feedback,
      'options': options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['idQuestion'] != null ? map['idQuestion'] as String : null,
      name: map['nameQuestion'] != null ? map['nameQuestion'] as String : null,
      feedback: map['feedback'] != null ? map['feedback'] as Feedback : null,
      options: map['options'] != null ? List<Option>.from(map['options']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}