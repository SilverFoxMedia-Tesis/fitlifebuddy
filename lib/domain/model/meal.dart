import 'dart:convert';

import 'package:fitlifebuddy/domain/model/food.dart';

class Meal {
  int? id;
  List<Food>? foods;
  String? dailyId;

  Meal({
    this.id,
    this.foods,
    this.dailyId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idMeal': id,
      'idDaily': dailyId,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['idMeal'] != null ? map['idMeal'] as int : null,
      dailyId: map['idDaily'] != null ? map['idDaily'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}