import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/type_food_condition.dart';

class FoodCondition {
  int? id;
  String? name;
  String? description;
  TypeFoodCondition? type;
  String? pacientId;

  FoodCondition({
    this.id,
    this.name,
    this.description,
    this.type,
    this.pacientId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'pacientId': pacientId,
    };
  }

  factory FoodCondition.fromMap(Map<String, dynamic> map) {
    return FoodCondition(
      id: map['idFoodCondition'] as int?,
      name: map['nameFoodCondition'] != null ? map['nameFoodCondition'] as String : null,
      description: map['descriptionFoodCondition'] != null ? map['descriptionFoodCondition'] as String : null,
      type: map['typeFoodCondition'] != null ? map['typeFoodCondition'] as TypeFoodCondition : null,
      pacientId: map['idPacient'] != null ? map['idPacient'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodCondition.fromJson(String source) =>
      FoodCondition.fromMap(json.decode(source) as Map<String, dynamic>);
}