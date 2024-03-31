import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/body_part.dart';
import 'package:fitlifebuddy/domain/enum/type_exercise.dart';

class Exercise {
  String? id;
  String? workout;
  String? sets;
  String? repPerSet;
  TypeExercise? type;
  BodyPart? bodyPart;

  Exercise({
    this.id,
    this.workout,
    this.sets,
    this.repPerSet,
    this.type,
    this.bodyPart,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'workout': workout,
      'sets': sets,
      'repPerSet': repPerSet,
      'type': type,
      'bodyPart': bodyPart,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['idExercise'] != null ? map['idExercise'] as String : null,
      workout: map['workout'] != null ? map['workout'] as String : null,
      sets: map['sets'] != null ? map['sets'] as String : null,
      repPerSet: map['repPerSet'] != null ? map['repPerSet'] as String : null,
      type: map['typeExercise'] != null ? map['typeExercise'] as TypeExercise : null,
      bodyPart: map['bodyPart'] != null ? map['bodyPart'] as BodyPart : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) =>
      Exercise.fromMap(json.decode(source) as Map<String, dynamic>);
}