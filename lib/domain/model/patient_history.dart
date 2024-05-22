import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/enum/physical_activity.dart';
import 'package:fitlifebuddy/domain/enum/type_health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class PatientHistory {
  int? id;
  num? abdominalCircumference;
  int? age;
  num? height;
  num? weight;
  Gender? gender;
  DietType? dietType;
  Patient? patient;
  PhysicalActivity? physicalActivity;
  TypeHealthCondition? typeHealthCondition;

  PatientHistory({
    this.id,
    this.abdominalCircumference,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.dietType,
    this.patient,
    this.physicalActivity,
    this.typeHealthCondition,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPacientHistory': id,
      'abdominalCircumference': abdominalCircumference,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender?.value,
      'dietType': dietType?.value,
      'pacient': patient?.toMap(),
      'physicalActivity': physicalActivity?.value,
      'typeHealthCondition': typeHealthCondition?.value,
    };
  }

  factory PatientHistory.fromMap(Map<String, dynamic> map) {
    return PatientHistory(
      id: map['idPacientHistory'] != null ? map['idPacientHistory'] as int : null,
      abdominalCircumference: map['abdominalCircumference'] != null ? map['abdominalCircumference'] as num : null,
      age: map['age'] !=null ? map['age'] as int : null,
      height: map['height'] != null ? map['height'] as num : null,
      weight: map['weight'] != null ? map['weight'] as num : null,
      gender: EnumExtension.getValue(Gender.values ,map['gender']),
      dietType: EnumExtension.getValue(DietType.values, map['dietType']),
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
      physicalActivity: EnumExtension.getValue(PhysicalActivity.values, map['physicalActivity']),
      typeHealthCondition: EnumExtension.getValue(TypeHealthCondition.values ,map['typeHealthCondition']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientHistory.fromJson(String source) =>
      PatientHistory.fromMap(json.decode(source) as Map<String, dynamic>);
}