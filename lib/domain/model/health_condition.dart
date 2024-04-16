import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/type_health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class HealthCondition {
  String? id;
  String? name;
  String? description;
  TypeHealthCondition? type;
  Patient? patient;

  HealthCondition({
    this.id,
    this.name,
    this.description,
    this.type,
    this.patient,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idHealthCondition': id,
      'nameHealthCondition': name,
      'descriptionHealthCondition': description,
      'typeHealthCondition': type,
      'pacient': patient?.toJson(),
    };
  }

  factory HealthCondition.fromMap(Map<String, dynamic> map) {
    return HealthCondition(
      id: map['idHealthCondition'] != null ? map['idHealthCondition'] as String : null,
      name: map['nameHealthCondition'] != null ? map['nameHealthCondition'] as String : null,
      description: map['descriptionHealthCondition'] != null ? map['descriptionHealthCondition'] as String : null,
      type: map['typeHealthCondition'] != null ? EnumExtension.getValue(TypeHealthCondition.values, map['typeHealthCondition']) : null,
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthCondition.fromJson(String source) =>
      HealthCondition.fromMap(json.decode(source) as Map<String, dynamic>);
}