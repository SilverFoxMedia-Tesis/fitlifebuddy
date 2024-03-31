import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';

class Plan {
  String? id;
  String? frecuently;
  DietType? dietType;
  Status? status;
  List<Daily>? dailies;
  String? patientId;

  Plan({
    this.id,
    this.frecuently,
    this.dietType,
    this.status,
    this.dailies,
    this.patientId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'frecuently': frecuently,
      'dietType': dietType,
      'status': status,
      'dailies': dailies,
      'patientId': patientId,
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['idPlan'] != null ? map['idPlan'] as String : null,
      frecuently: map['frecuently'] != null ? map['frecuently'] as String : null,
      dietType: map['dietType'] != null ? map['dietType'] as DietType : null,
      status: map['status'] != null ? map['status'] as Status : null,
      dailies: map['dailies'] != null ? List<Daily>.from(map['dailies']) : null,
      patientId: map['idPatient'] != null ? map['idPatient'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);
}