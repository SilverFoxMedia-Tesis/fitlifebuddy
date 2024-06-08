import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/meal_time.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/food.dart';

class Meal {
  int? id;
  MealTime? timeMeal;
  List<Food>? foods;
  Daily? daily;
  String? fullname;
  String? imageUrl;

  Meal({
    this.id,
    this.timeMeal,
    this.foods,
    this.daily,
    this.fullname,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idMeal': id,
      "timeMeal": timeMeal,
      'daily': daily?.toMap(),
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['idMeal'] != null ? map['idMeal'] as int : null,
      timeMeal: map['timeMeal'] != null ? EnumExtension.getValue(MealTime.values, map['timeMeal']) : null,
      daily: map['daily'] != null ? Daily.fromMap(map['daily'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}