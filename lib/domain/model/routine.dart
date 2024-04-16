import 'dart:convert';

import 'package:fitlifebuddy/domain/model/daily.dart';

class Routine {
  String? id;
  String? name;
  String? description;
  Daily? daily;

  Routine({
    this.id,
    this.name,
    this.description,
    this.daily,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRoutine': id,
      'nameRoutine': name,
      'descriptionRoutine': description,
      'daily': daily?.toJson(),
    };
  }

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      id: map['idRoutine'] != null ? map['idRoutine'] as String : null,
      name: map['nameRoutine'] != null ? map['nameRoutine'] as String : null,
      description: map['descriptionRoutine'] != null ? map['descriptionRoutine'] as String : null,
      daily: map['daily'] != null ? Daily.fromMap(map['daily'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Routine.fromJson(String source) =>
      Routine.fromMap(json.decode(source) as Map<String, dynamic>);
}