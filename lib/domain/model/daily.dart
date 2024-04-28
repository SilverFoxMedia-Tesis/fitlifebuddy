import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';

class Daily {
  int? id;
  String? date;
  int? dateNumber;
  List<Meal>? meals;
  Routine? routine;
  String? planId;
  Status? status;

  Daily({
    this.id,
    this.date,
    this.dateNumber,
    this.meals,
    this.routine,
    this.planId,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idDaily': id,
      'date': date,
      'dateNumber': dateNumber,
      'IdPlan': planId,
      'status': status,
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      id: map['idDaily'] != null ? map['idDaily'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
      dateNumber: map['dateNumber'] != null ? map['dateNumber'] as int : null,
      planId: map['IdPlan'] != null ? map['IdPlan'] as String : null,
      status: map['status'] != null ? EnumExtension.getValue(Status.values, map['status']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source) as Map<String, dynamic>);
}

