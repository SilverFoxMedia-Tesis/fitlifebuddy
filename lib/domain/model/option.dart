import 'dart:convert';

import 'package:fitlifebuddy/domain/model/question.dart';

class Option {
  int? id;
  String? name;
  Question? question;

  Option({
    this.id,
    this.name,
    this.question,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOption': id,
      'nameOption': name,
      'question': question,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['idOption'] != null ? map['idOption'] as int : null,
      name: map['nameOption'] != null ? map['nameOption'] as String : null,
      question: map['question'] != null ? Question.fromMap(map['question'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) =>
      Option.fromMap(json.decode(source) as Map<String, dynamic>);
}