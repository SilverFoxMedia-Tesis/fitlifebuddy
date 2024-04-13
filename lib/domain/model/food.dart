import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/category_name.dart';

class Food {
  int? id;
  String? name;
  String? measure;
  double? grams;
  double? calories;
  double? fat;
  double? satFat;
  double? fiber;
  double? carbs;
  CategoryName? categoryName;

  Food({
    this.id,
    this.name,
    this.measure,
    this.grams,
    this.calories,
    this.fat,
    this.satFat,
    this.fiber,
    this.carbs,
    this.categoryName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'measure': measure,
      'grams': grams,
      'calories': calories,
      'fat': fat,
      'satFat': satFat,
      'fiber': fiber,
      'carbs': carbs,
      'categoryName': categoryName,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['idFood'] as int?,
      name: map['nameFood'] != null ? map['nameFood'] as String : null,
      measure: map['measure'] != null ? map['measure'] as String : null,
      grams: map['grams'] != null ? map['grams'] as double : null,
      calories: map['calories'] != null ? map['calories'] as double : null,
      fat: map['fat'] != null ? map['fat'] as double : null,
      satFat: map['satFat'] != null ? map['satFat'] as double : null,
      fiber: map['fiber'] != null ? map['fiber'] as double : null,
      carbs: map['carbs'] != null ? map['carbs'] as double : null,
      categoryName: map['categoryName'] != null ? map['categoryName'] as CategoryName : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);
}