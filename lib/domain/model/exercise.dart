import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/body_part.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/exercise_type.dart';

class Exercise {
  int? id;
  String? workout;
  String? sets;
  String? repsPerSet;
  ExerciseType? type;
  BodyPart? bodyPart;
  String? imageUrl;

  Exercise({
    this.id,
    this.workout,
    this.sets,
    this.repsPerSet,
    this.type,
    this.bodyPart,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idExercise': id,
      'workout': workout,
      'sets': sets,
      'repsPerSet': repsPerSet,
      'typeExercise': type?.value,
      'bodyPart': bodyPart?.value,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['idExercise'] != null ? map['idExercise'] as int : null,
      workout: map['workout'] != null ? map['workout'] as String : null,
      sets: map['sets'] != null ? map['sets'] as String : null,
      repsPerSet: map['repsPerSet'] != null ? map['repsPerSet'] as String : null,
      type: map['typeExercise'] != null ? EnumExtension.getValue(ExerciseType.values, map['typeExercise']) : null,
      bodyPart: map['bodyPart'] != null ? EnumExtension.getValue(BodyPart.values, map['bodyPart']): null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) =>
      Exercise.fromMap(json.decode(source) as Map<String, dynamic>);
}