import 'dart:convert';

import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';

class Daily {
  int? id;
  String? date;
  int? dateNumber;
  String? planId;
  List<Meal>? meals;
  List<Routine>? routines;

  Daily({
    this.id,
    this.date,
    this.dateNumber,
    this.planId,
    this.meals,
    this.routines,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'dateNumber': dateNumber,
      'planId': planId,
      'meals': meals,
      'routines': routines,
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      id: map['idDaily'] as int?,
      date: map['date'] != null ? map['date'] as String : null,
      dateNumber: map['dateNumber'] != null ? map['dateNumber'] as int : null,
      planId: map['idPlan'] != null ? map['idPlan'] as String : null,
      meals: map['meals'] != null ? List<Meal>.from(map['meals']) : null,
      routines: map['routines'] != null ? List<Routine>.from(map['routines']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source) as Map<String, dynamic>);
}

