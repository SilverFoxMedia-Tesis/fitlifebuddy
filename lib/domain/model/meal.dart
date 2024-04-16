import 'dart:convert';


class Meal {
  int? id;
  String? name;
  String? description;
  String? dailyId;

  Meal({
    this.id,
    this.name,
    this.description,
    this.dailyId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'dailyId': dailyId,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['idMeal'] as int?,
      name: map['nameMeal'] != null ? map['nameMeal'] as String : null,
      description: map['descriptionMeal'] != null ? map['descriptionMeal'] as String : null,
      dailyId: map['idDaily'] != null ? map['idDaily'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}