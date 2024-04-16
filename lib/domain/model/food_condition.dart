import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/type_food_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class FoodCondition {
  String? id;
  String? name;
  String? description;
  TypeFoodCondition? type;
  Patient? patient;

  FoodCondition({
    this.id,
    this.name,
    this.description,
    this.type,
    this.patient,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idFoodCondition': id,
      'nameFoodCondition': name,
      'descriptionFoodCondition': description,
      'typeFoodCondition': type,
      'pacient': patient?.toJson(),
    };
  }

  factory FoodCondition.fromMap(Map<String, dynamic> map) {
    return FoodCondition(
      id: map['idFoodCondition'] != null ? map['idFoodCondition'] as String : null,
      name: map['nameFoodCondition'] != null ? map['nameFoodCondition'] as String : null,
      description: map['descriptionFoodCondition'] != null ? map['descriptionFoodCondition'] as String : null,
      type: map['typeFoodCondition'] != null ? EnumExtension.getValue(TypeFoodCondition.values, map['typeFoodCondition']) : null,
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodCondition.fromJson(String source) =>
      FoodCondition.fromMap(json.decode(source) as Map<String, dynamic>);
}