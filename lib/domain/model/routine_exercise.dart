import 'dart:convert';

import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';

class RoutineExercise {
  String? id;
  Routine? routine;
  Exercise? exercise;

  RoutineExercise({
    this.id,
    this.routine,
    this.exercise,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': routine,
      'description': exercise,
    };
  }

  factory RoutineExercise.fromMap(Map<String, dynamic> map) {
    return RoutineExercise(
      id: map['idRoutineExercise'] != null ? map['idRoutine'] as String : null,
      routine: map['routine'] != null ? map['nameRoutine'] as Routine : null,
      exercise: map['exercise'] != null ? map['descriptionRoutine'] as Exercise : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineExercise.fromJson(String source) =>
      RoutineExercise.fromMap(json.decode(source) as Map<String, dynamic>);
}