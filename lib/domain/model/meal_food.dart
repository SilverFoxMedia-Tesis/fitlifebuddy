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
      'idMealFood': id,
      'meal': meal?.toJson(),
      'food': food?.toJson(),
    };
  }

  factory MealFood.fromMap(Map<String, dynamic> map) {
    return MealFood(
      id: map['idMealFood'] != null ? map['idMealFood'] as String : null,
      meal: map['meal'] != null ? Meal.fromMap(map['meal'] as Map<String, dynamic>) : null,
      food: map['food'] != null ? Food.fromMap(map['food'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealFood.fromJson(String source) =>
      MealFood.fromMap(json.decode(source) as Map<String, dynamic>);
}