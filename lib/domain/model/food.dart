import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/category_name.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';

class Food {
  String? id;
  String? name;
  String? measure;
  num? grams;
  num? calories;
  num? fat;
  num? satFat;
  num? fiber;
  num? carbs;
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
      'idFood': id,
      'nameFood': name,
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
      id: map['idFood'] != null ? map['idFood'] as String : null,
      name: map['nameFood'] != null ? map['nameFood'] as String : null,
      measure: map['measure'] != null ? map['measure'] as String : null,
      grams: map['grams'] != null ? map['grams'] as num : null,
      calories: map['calories'] != null ? map['calories'] as num : null,
      fat: map['fat'] != null ? map['fat'] as num : null,
      satFat: map['satFat'] != null ? map['satFat'] as num : null,
      fiber: map['fiber'] != null ? map['fiber'] as num : null,
      carbs: map['carbs'] != null ? map['carbs'] as num : null,
      categoryName: map['categoryName'] != null ? EnumExtension.getValue(CategoryName.values, map['categoryName']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);
}