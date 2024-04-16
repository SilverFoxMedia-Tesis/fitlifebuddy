import 'dart:convert';

import 'package:fitlifebuddy/domain/model/daily.dart';

class Feedback {
  String? id;
  Daily? daily;

  Feedback({
    this.id,
    this.daily,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idFeedback': id,
      'daily': daily?.toJson(),
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['idFeedback'] != null ? map['idFeedback'] as String : null,
      daily: map['daily'] != null ? Daily.fromMap(map['daily'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feedback.fromJson(String source) =>
      Feedback.fromMap(json.decode(source) as Map<String, dynamic>);
}