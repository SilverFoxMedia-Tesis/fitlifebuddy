import 'dart:convert';

import 'package:fitlifebuddy/domain/model/person.dart';

class Nutritionist {
  String? id;
  Person? person;

  Nutritionist({
    this.id,
    this.person,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idNutritionist': id,
      'personId': person?.toMap(),
    };
  }

  factory Nutritionist.fromMap(Map<String, dynamic> map) {
    return Nutritionist(
      id: map['idNutritionist'] != null ? map['idNutritionist'] as String : null,
      person: map['person'] != null ? Person.fromMap(map['person'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutritionist.fromJson(String source) =>
      Nutritionist.fromMap(json.decode(source) as Map<String, dynamic>);
}