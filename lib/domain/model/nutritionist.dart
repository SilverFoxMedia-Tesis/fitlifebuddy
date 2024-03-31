import 'dart:convert';

import 'package:fitlifebuddy/domain/model/patient.dart';

class Nutritionist {
  String? id;
  List<Patient>? patients;
  String? personId;

  Nutritionist({
    this.id,
    this.patients,
    this.personId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'patients': patients,
      'personId': personId,
    };
  }

  factory Nutritionist.fromMap(Map<String, dynamic> map) {
    return Nutritionist(
      id: map['id'] != null ? map['id'] as String : null,
      patients: map['patients'] != null ? List<Patient>.from(map['healthConditions']) : null,
      personId: map['idPerson'] != null ? map['idPerson'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutritionist.fromJson(String source) =>
      Nutritionist.fromMap(json.decode(source) as Map<String, dynamic>);
}