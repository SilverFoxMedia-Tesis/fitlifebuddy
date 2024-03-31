import 'dart:convert';

import 'package:fitlifebuddy/domain/model/exercise.dart';

class Routine {
  String? id;
  String? name;
  String? description;
  String? dailyId;
  List<Exercise>? exercises;

  Routine({
    this.id,
    this.name,
    this.description,
    this.dailyId,
    this.exercises,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'dailyId': dailyId,
      'exercises': exercises,
    };
  }

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      id: map['idRoutine'] != null ? map['idRoutine'] as String : null,
      name: map['nameRoutine'] != null ? map['nameRoutine'] as String : null,
      description: map['descriptionRoutine'] != null ? map['descriptionRoutine'] as String : null,
      dailyId: map['idDaily'] != null ? map['idDaily'] as String : null,
      exercises: map['routineExercises'] != null ? List<Exercise>.from(map['routineExercises']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Routine.fromJson(String source) =>
      Routine.fromMap(json.decode(source) as Map<String, dynamic>);
}