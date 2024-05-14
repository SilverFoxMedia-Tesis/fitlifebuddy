import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/time_meal.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:get/get.dart';

class Meal {
  int? id;
  TimeMeal? timeMeal;
  List<Food>? foods;
  Daily? daily;

  Meal({
    this.id,
    this.timeMeal,
    this.foods,
    this.daily,
  });

String getName() {
  if (foods == null || foods!.isEmpty) return '';
  
  final names = foods!
    .map((food) => food.name?.toLowerCase() ?? '')
    .where((name) => name.isNotEmpty)
    .toList();
  
  if (names.isEmpty) return '';

  if (names.length == 1) {
    return names.first.capitalizeFirst ?? '';
  }

  var result = names.sublist(0, names.length - 1).join(', ');
  result += ' y ${names.last}';

  return result.capitalizeFirst ?? '';
}

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
      timeMeal: map['timeMeal'] != null ? EnumExtension.getValue(TimeMeal.values, map['timeMeal']) : null,
      daily: map['daily'] != null ? Daily.fromMap(map['daily'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}