import 'dart:convert';

import 'package:fitlifebuddy/domain/model/food_condition.dart';
import 'package:fitlifebuddy/domain/model/health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';

class Patient {
  String? id;
  double? height;
  double? weight;
  String? gender;
  String? birthDate;
  List<PatientHistory>? patientHistories;
  List<Plan>? plans;
  List<FoodCondition>? foodConditions;
  List<HealthCondition>? healthConditions;
  String? nutritionistId;
  String? personId;

  Patient({
    this.id,
    this.height,
    this.weight,
    this.gender,
    this.birthDate,
    this.patientHistories,
    this.plans,
    this.foodConditions,
    this.healthConditions,
    this.nutritionistId,
    this.personId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'height': height,
      'weight': weight,
      'gender': gender,
      'birthDate': birthDate,

      'nutritionistId': nutritionistId,
      'personId': personId,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['idPatient'] != null ? map['idPatient'] as String : null,
      height: map['height'] != null ? map['height'] as double : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      birthDate: map['birthDate'] != null ? map['birthDate'] as String : null,
      patientHistories: map['patientHistories'] != null ? List<PatientHistory>.from(map['patientHistories']) : null,
      plans: map['plans'] != null ? List<Plan>.from(map['plans']) : null,
      foodConditions: map['foodConditions'] != null ? List<FoodCondition>.from(map['foodConditions']) : null,
      healthConditions: map['healthConditions'] != null ? List<HealthCondition>.from(map['healthConditions']) : null,
      nutritionistId: map['idNutritionist'] != null ? map['idNutritionist'] as String : null,
      personId: map['idPerson'] != null ? map['idPerson'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);
}