import 'dart:convert';

import 'package:fitlifebuddy/domain/model/food.dart';

class Meal {
  String? id;
  String? name;
  String? description;
  String? dailyId;
  List<Food>? foods;

  Meal({
    this.id,
    this.name,
    this.description,
    this.dailyId,
    this.foods,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'dailyId': dailyId,
      'foods': foods,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['idMeal'] != null ? map['idMeal'] as String : null,
      name: map['nameMeal'] != null ? map['nameMeal'] as String : null,
      description: map['descriptionMeal'] != null ? map['descriptionMeal'] as String : null,
      dailyId: map['idDaily'] != null ? map['idDaily'] as String : null,
      foods: map['mealFoods'] != null ? List<Food>.from(map['mealFoods']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}