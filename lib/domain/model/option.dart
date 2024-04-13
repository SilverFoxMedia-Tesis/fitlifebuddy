import 'dart:convert';

class Option {
  int? id;
  String? name;
  int? questionId;

  Option({
    this.id,
    this.name,
    this.questionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'questionId': questionId,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['idOption'] as int?,
      name: map['nameOption'] != null ? map['nameOption'] as String : null,
      questionId: map['idQuestion'] != null ? map['idQuestion'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) =>
      Option.fromMap(json.decode(source) as Map<String, dynamic>);
}