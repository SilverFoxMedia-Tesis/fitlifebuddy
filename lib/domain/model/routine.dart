import 'dart:convert';

import 'package:fitlifebuddy/domain/model/daily.dart';

class Routine {
  int? id;
  Daily? daily;

  Routine({
    this.id,
    this.daily,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRoutine': id,
      'daily': daily?.toMap(),
    };
  }

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      id: map['idRoutine'] != null ? map['idRoutine'] as int : null,
      daily: map['daily'] != null ? Daily.fromMap(map['daily'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Routine.fromJson(String source) =>
      Routine.fromMap(json.decode(source) as Map<String, dynamic>);
}