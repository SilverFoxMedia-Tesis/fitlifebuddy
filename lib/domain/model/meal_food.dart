import 'dart:convert';

import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';

class MealFood {
  String? id;
  Meal? meal;
  Food? food;

  MealFood({
    this.id,
    this.meal,
    this.food,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': meal,
      'description': food,
    };
  }

  factory MealFood.fromMap(Map<String, dynamic> map) {
    return MealFood(
      id: map['idMealFood'] != null ? map['idMealFood'] as String : null,
      meal: map['meal'] != null ? map['meal'] as Meal : null,
      food: map['food'] != null ? map['food'] as Food : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealFood.fromJson(String source) =>
      MealFood.fromMap(json.decode(source) as Map<String, dynamic>);
}