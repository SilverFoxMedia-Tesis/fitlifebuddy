import 'dart:convert';

import 'package:fitlifebuddy/domain/model/daily.dart';


class Meal {
  String? id;
  String? name;
  String? description;
  Daily? daily;

  Meal({
    this.id,
    this.name,
    this.description,
    this.daily,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idMeal': id,
      'nameMeal': name,
      'descriptionMeal': description,
      'daily': daily?.toJson(),
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['idMeal'] != null ? map['idMeal'] as String : null,
      name: map['nameMeal'] != null ? map['nameMeal'] as String : null,
      description: map['descriptionMeal'] != null ? map['descriptionMeal'] as String : null,
      daily: map['daily'] != null ? Daily.fromMap(map['daily'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}