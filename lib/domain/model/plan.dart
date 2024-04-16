import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/frecuently.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class Plan {
  int? id;
  num? calorieDeficit;
  num? carbohydrates;
  num? fats; 
  num? proteins;
  num? tmb;
  num? weightLose;
  DietType? dietType;
  Frecuently? frecuently;
  Patient? patient;
  Status? status;

  Plan({
    this.id,
    this.calorieDeficit,
    this.carbohydrates,
    this.fats,
    this.proteins,
    this.tmb,
    this.weightLose,
    this.dietType,
    this.frecuently,
    this.patient,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPlan': id,
      'calorieDeficit': calorieDeficit,
      'carbohydrates_g': carbohydrates,
      'fats_g': fats,
      'proteins_g': proteins,
      'tmb': tmb,
      'weightLose': weightLose,
      'dietType': dietType,
      'frecuently': frecuently,
      'pacient': patient?.toJson(),
      'status': status,
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['idPlan'] != null ? map['idPlan'] as int : null,
      calorieDeficit: map['calorieDeficit'] != null ? map['calorieDeficit'] as num : null,
      carbohydrates: map['carbohydrates_g'] != null ? map['carbohydrates_g'] as num : null,
      fats: map['fats_g'] != null ? map['fats_g'] as num : null,
      proteins: map['proteins_g'] != null ? map['proteins_g'] as num : null,
      tmb: map['tmb'] != null ? map['tmb'] as num : null,
      weightLose: map['weightLose'] != null ? map['weightLose'] as num : null,
      dietType: map['dietType'] != null ? EnumExtension.getValue(DietType.values, map['dietType']): null,
      frecuently: map['frecuently'] != null ? EnumExtension.getValue(Frecuently.values, map['frecuently']) : null,
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
      status: map['status'] != null ? EnumExtension.getValue(Status.values, map['status']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);
}