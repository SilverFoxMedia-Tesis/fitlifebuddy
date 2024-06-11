import 'dart:convert';

import 'package:fitlifebuddy/domain/model/nutritionist.dart';
import 'package:fitlifebuddy/domain/model/person.dart';

class Patient {
  int? id;
  String? birthDate;
  Nutritionist? nutritionist;
  Person? person;

  Patient({
    this.id,
    this.birthDate,
    this.nutritionist,
    this.person,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPacient': id,
      'birthDate': birthDate,
      'nutritionist': nutritionist?.toMap(),
      'person': person?.toMap(),
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['idPacient'] != null ? map['idPacient'] as int : null,
      birthDate: map['birthDate'] != null ? map['birthDate'] as String : null,
      nutritionist: map['nutritionist'] != null ? Nutritionist.fromMap(map['nutritionist'] as Map<String, dynamic>) : null,
      person: map['person'] != null ? Person.fromMap(map['person'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);
}