import 'dart:convert';

import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';

class MealFood {
  int? id;
  Meal? meal;
  Food? food;

  MealFood({
    this.id,
    this.meal,
    this.food,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idMeal': id,
      "meal": meal?.toMap(),
      'food': food?.toMap(),
    };
  }

  factory MealFood.fromMap(Map<String, dynamic> map) {
    return MealFood(
      id: map['idMeal'] != null ? map['idMeal'] as int : null,
      meal: map['meal'] != null ? Meal.fromMap(map['meal'] as Map<String, dynamic>) : null,
      food: map['food'] != null ? Food.fromMap(map['food'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealFood.fromJson(String source) =>
      MealFood.fromMap(json.decode(source) as Map<String, dynamic>);
}