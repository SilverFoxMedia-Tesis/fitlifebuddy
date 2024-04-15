import 'dart:convert';


class Patient {
  int? id;
  String? birthDate;
  int? nutritionistId;
  int? personId;

  Patient({
    this.id,
    this.birthDate,
    this.nutritionistId,
    this.personId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPacient': id,
      'birthDate': birthDate,
      'idNutritionist': nutritionistId,
      'idPerson': personId,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['idPacient'] as int?,
      birthDate: map['birthDate'] as String?,
      nutritionistId: map['nutritionist'] != null ? map['nutritionist']['idNutritionist'] as int? : null,
      personId: map['person'] != null ? map['person']['idPerson'] as int? : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);
}