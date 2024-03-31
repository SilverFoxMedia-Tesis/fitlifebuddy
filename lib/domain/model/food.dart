import 'dart:convert';
import 'dart:ffi';

import 'package:fitlifebuddy/domain/enum/category_name.dart';

class Food {
  String? id;
  String? name;
  String? measure;
  Float? grams;
  Float? calories;
  Float? fat;
  Float? satFat;
  Float? fiber;
  Float? carbs;
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
      id: map['idFood'] != null ? map['idFood'] as String : null,
      name: map['nameFood'] != null ? map['nameFood'] as String : null,
      measure: map['measure'] != null ? map['measure'] as String : null,
      grams: map['grams'] != null ? map['grams'] as Float : null,
      calories: map['calories'] != null ? map['calories'] as Float : null,
      fat: map['fat'] != null ? map['fat'] as Float : null,
      satFat: map['satFat'] != null ? map['satFat'] as Float : null,
      fiber: map['fiber'] != null ? map['fiber'] as Float : null,
      carbs: map['carbs'] != null ? map['carbs'] as Float : null,
      categoryName: map['categoryName'] != null ? map['categoryName'] as CategoryName : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);
}