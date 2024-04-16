import 'dart:convert';

import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';

class RoutineExercise {
  int? id;
  Routine? routine;
  Exercise? exercise;

  RoutineExercise({
    this.id,
    this.routine,
    this.exercise,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRoutineExercise': id,
      'routine': routine?.toJson(),
      'exercise': exercise?.toJson(),
    };
  }

  factory RoutineExercise.fromMap(Map<String, dynamic> map) {
    return RoutineExercise(
      id: map['idRoutineExercise'] != null ? map['idRoutineExercise'] as int : null,
      routine: map['routine'] != null ? Routine.fromMap(map['nameRoutine'] as Map<String, dynamic>) : null,
      exercise: map['exercise'] != null ? Exercise.fromMap(map['descriptionRoutine'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineExercise.fromJson(String source) =>
      RoutineExercise.fromMap(json.decode(source) as Map<String, dynamic>);
}