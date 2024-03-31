import 'dart:convert';

import 'package:fitlifebuddy/domain/model/question.dart';

class Feedback {
  String? id;
  String? planId;
  String? dailyId;
  int? punctuation;
  List<Question>? questions;

  Feedback({
    this.id,
    this.planId,
    this.dailyId,
    this.punctuation,
    this.questions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'planId': planId,
      'dailyId': dailyId,
      'punctuation': punctuation,
      'questions': questions,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['idFeedback'] != null ? map['idFeedback'] as String : null,
      planId: map['idPlan'] != null ? map['idPlan'] as String : null,
      dailyId: map['idDaily'] != null ? map['idDaily'] as String : null,
      punctuation: map['punctuation'] != null ? map['punctuation'] as int : null,
      questions: map['questions'] != null ? List<Question>.from(map['questions']): null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feedback.fromJson(String source) =>
      Feedback.fromMap(json.decode(source) as Map<String, dynamic>);
}