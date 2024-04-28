import 'dart:convert';

import 'package:fitlifebuddy/domain/model/exercise.dart';

class Routine {
  int? id;
  List<Exercise>? exercises;
  String? dailyId;

  Routine({
    this.id,
    this.exercises,
    this.dailyId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRoutine': id,
      'idDaily': dailyId,
    };
  }

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      id: map['idRoutine'] != null ? map['idRoutine'] as int : null,
      dailyId: map['idDaily'] != null ? map['idDaily'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Routine.fromJson(String source) =>
      Routine.fromMap(json.decode(source) as Map<String, dynamic>);
}