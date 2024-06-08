import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/bmi_category.dart';
import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/frecuency.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class Plan {
  int? id;
  num? tmb;
  num? weightLose;
  num? calorieDeficit;
  num? carbs;
  num? proteins;
  num? fats;
  num? breakfastCarbs;
  num? breakfastProteins;
  num? breakfastFats;
  num? lunchCarbs;
  num? lunchProteins;
  num? lunchFats;
  num? dinnerCarbs;
  num? dinnerProteins;
  num? dinnerFats;
  num? abdominalPerimeter;
  num? physicalActivity;
  BMICategory? bmiCategory;
  DietType? dietType;
  Frecuency? frecuency;
  Status? status;
  Patient? patient;

  Plan({
    this.id,
    this.tmb,
    this.weightLose,
    this.calorieDeficit,
    this.carbs,
    this.proteins,
    this.fats,
    this.breakfastCarbs,
    this.breakfastProteins,
    this.breakfastFats,
    this.lunchCarbs,
    this.lunchProteins,
    this.lunchFats,
    this.dinnerCarbs,
    this.dinnerProteins,
    this.dinnerFats,
    this.abdominalPerimeter,
    this.physicalActivity,
    this.bmiCategory,
    this.dietType,
    this.frecuency,
    this.status,
    this.patient,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPlan': id,
      "tmb": tmb,
      "weightLose": 5,
      "calorieDeficit": calorieDeficit,
      "carbohydrates_g": carbs,
      "proteins_g": proteins,
      "fats_g": fats,
      "desayuno_carbs": breakfastCarbs,
      "desayuno_proten": breakfastProteins,
      "desayuno_grasas": breakfastFats,
      "almuerzo_carbs": lunchCarbs,
      "almuerzo_proten": lunchProteins,
      "almuerzo_grasas": lunchFats,
      "cena_carbs": dinnerCarbs,
      "cena_proten": dinnerProteins,
      "cena_grasas": dinnerFats,
      "abdominal_circumference": abdominalPerimeter,
      "physical_activity": physicalActivity,
      "classificationIMC": bmiCategory?.value,
      'dietType': dietType?.value,
      'frecuently': frecuency?.value,
      'status': status?.value,
      'pacient': patient?.toMap(),
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['idPlan'] != null ? map['idPlan'] as int : null,
      tmb: map['tmb'] != null ? map['tmb'] as num : null,
      weightLose: map['weightLose'] != null ? map['weightLose'] as num : null,
      calorieDeficit: map['calorieDeficit'] != null ? map['calorieDeficit'] as num : null,
      carbs: map['carbohydrates_g'] != null ? map['carbohydrates_g'] as num : null,
      proteins: map['proteins_g'] != null ? map['proteins_g'] as num : null,
      fats: map['fats_g'] != null ? map['fats_g'] as num : null,
      breakfastCarbs: map['desayuno_carbs'] != null ? map['desayuno_carbs'] as num : null,
      breakfastProteins: map['desayuno_proten'] != null ? map['desayuno_proten'] as num : null,
      breakfastFats: map['desayuno_grasas'] != null ? map['desayuno_grasas'] as num : null,
      lunchCarbs: map['almuerzo_carbs'] != null ? map['almuerzo_carbs'] as num : null,
      lunchProteins: map['almuerzo_proten'] != null ? map['almuerzo_proten'] as num : null,
      lunchFats: map['almuerzo_grasas'] != null ? map['almuerzo_grasas'] as num : null,
      dinnerCarbs: map['cena_carbs'] != null ? map['cena_carbs'] as num : null,
      dinnerProteins: map['cena_proten'] != null ? map['cena_proten'] as num : null,
      dinnerFats: map['cena_grasas'] != null ? map['cena_grasas'] as num : null,
      abdominalPerimeter: map['abdominal_circumference'] != null ? map['abdominal_circumference'] as num : null,
      physicalActivity: map['physical_activity'] != null ? map['physical_activity'] as num : null,
      bmiCategory: map['classificationIMC'] != null ? EnumExtension.getValue(BMICategory.values, map['classificationIMC']) : null,
      dietType: map['dietType'] != null ? EnumExtension.getValue(DietType.values, map['dietType']) : null,
      frecuency: map['frecuently'] != null ? EnumExtension.getValue(Frecuency.values, map['frecuently']) : null,
      status: map['status'] != null ? EnumExtension.getValue(Status.values, map['status']) : null,
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);
}