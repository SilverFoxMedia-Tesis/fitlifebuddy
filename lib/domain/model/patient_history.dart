import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/frecuently.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/enum/physical_activity.dart';

class PatientHistory {
  int? id;
  double? height;
  double? weight;
  Gender? gender;
  int? age;
  double? abdominalCircumference;
  PhysicalActivity? physicalActivity;
  Frecuently? frecuently;
  DietType? dietType;
  int? patientId;

  PatientHistory({
    this.id,
    this.height,
    this.weight,
    this.gender,
    this.age,
    this.abdominalCircumference,
    this.physicalActivity,
    this.frecuently,
    this.dietType,
    this.patientId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'height': height,
      'weight': weight,
      'gender': gender,
      'age': age,
      'abdominalCircumference': abdominalCircumference,
      'physicalActivity': physicalActivity,
      'frecuently': frecuently,
      'dietType': dietType,
      'patientId': patientId,
    };
  }

  factory PatientHistory.fromMap(Map<String, dynamic> map) {
    return PatientHistory(
      id: map['idPacientHistory'] as int?,
      height: map['height'] as double?,
      weight: map['weight'] as double?,
      gender: Gender.fromString(map['gender']),
      age: map['age'] as int?,
      abdominalCircumference: map['abdominalCircumference'] as double?,
      physicalActivity: PhysicalActivity.fromString(map['physicalActivity']),
      frecuently: Frecuently.fromString(map['frecuently']),
      dietType: DietType.fromString(map['dietType']),
      patientId: map['pacient'] != null ? map['pacient']['idPacient'] as int? : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientHistory.fromJson(String source) =>
      PatientHistory.fromMap(json.decode(source) as Map<String, dynamic>);
}