import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/type_health_condition.dart';

class HealthCondition {
  String? id;
  String? name;
  String? description;
  TypeHealthCondition? type;
  String? patientId;

  HealthCondition({
    this.id,
    this.name,
    this.description,
    this.type,
    this.patientId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'patientId': patientId,
    };
  }

  factory HealthCondition.fromMap(Map<String, dynamic> map) {
    return HealthCondition(
      id: map['idHealthCondition'] != null ? map['idHealthCondition'] as String : null,
      name: map['nameHealthCondition'] != null ? map['nameHealthCondition'] as String : null,
      description: map['descriptionHealthCondition'] != null ? map['descriptionHealthCondition'] as String : null,
      type: map['typeHealthCondition'] != null ? map['typeHealthCondition'] as TypeHealthCondition : null,
      patientId: map['idPatient'] != null ? map['idPatient'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthCondition.fromJson(String source) =>
      HealthCondition.fromMap(json.decode(source) as Map<String, dynamic>);
}