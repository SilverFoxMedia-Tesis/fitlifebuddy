import 'dart:convert';

import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';

class RoutineExercise {
  int? idRoutineExercise;
  Routine? routine;
  Exercise? exercise;

  RoutineExercise({
    this.idRoutineExercise,
    this.routine,
    this.exercise,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRoutineExercise': idRoutineExercise,
      'routine': routine?.toMap(),
      'exercise': exercise?.toMap(),
    };
  }

  factory RoutineExercise.fromMap(Map<String, dynamic> map) {
    return RoutineExercise(
      idRoutineExercise: map['idRoutineExercise'] != null ? map['idRoutineExercise'] as int : null,
      routine: map['routine'] != null ? Routine.fromMap(map['routine'] as Map<String, dynamic>) : null,
      exercise: map['exercise'] != null ? Exercise.fromMap(map['exercise'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineExercise.fromJson(String source) =>
      RoutineExercise.fromMap(json.decode(source) as Map<String, dynamic>);
}