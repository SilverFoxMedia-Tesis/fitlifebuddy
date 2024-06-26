import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/food_condition_type.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class FoodCondition with CustomDropdownListFilter {
  int? id;
  String? name;
  String? description;
  FoodConditionType? type;
  Patient? patient;

  FoodCondition({
    this.id,
    this.name,
    this.description,
    this.type,
    this.patient,
  });

  @override
  String toString() {
    return name ?? '';
  }

  @override
  bool filter(String query) {
    return (name?.toLowerCase() ?? '').contains(query.toLowerCase());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idFoodCondition': id,
      'nameFoodCondition': name,
      'descriptionFoodCondition': description,
      'typeFoodCondition': type?.value,
      'pacient': patient?.toMap(),
    };
  }

  factory FoodCondition.fromMap(Map<String, dynamic> map) {
    return FoodCondition(
      id: map['idFoodCondition'] != null ? map['idFoodCondition'] as int : null,
      name: map['nameFoodCondition'] != null ? map['nameFoodCondition'] as String : null,
      description: map['descriptionFoodCondition'] != null ? map['descriptionFoodCondition'] as String : null,
      type: map['typeFoodCondition'] != null ? EnumExtension.getValue(FoodConditionType.values, map['typeFoodCondition']) : null,
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodCondition.fromJson(String source) =>
      FoodCondition.fromMap(json.decode(source) as Map<String, dynamic>);
}