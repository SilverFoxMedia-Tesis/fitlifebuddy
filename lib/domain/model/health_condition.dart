import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/health_condition_type.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';

class HealthCondition with CustomDropdownListFilter {
  int? id;
  String? name;
  String? description;
  HealthConditionType? type;
  Patient? patient;

  HealthCondition({
    this.id,
    this.name,
    this.description,
    this.type,
    this.patient,
  });

  @override
  String toString() {
    return name ?? '';
  }

  @override
  bool filter(String query) {
    return (name?.toLowerCase() ?? '').contains(query.toLowerCase());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idHealthCondition': id,
      'nameHealthCondition': name,
      'descriptionHealthCondition': description,
      'typeHealthCondition': type?.value,
      'pacient': patient?.toMap(),
    };
  }

  factory HealthCondition.fromMap(Map<String, dynamic> map) {
    return HealthCondition(
      id: map['idHealthCondition'] != null ? map['idHealthCondition'] as int : null,
      name: map['nameHealthCondition'] != null ? map['nameHealthCondition'] as String : null,
      description: map['descriptionHealthCondition'] != null ? map['descriptionHealthCondition'] as String : null,
      type: map['typeHealthCondition'] != null ? EnumExtension.getValue(HealthConditionType.values, map['typeHealthCondition']) : null,
      patient: map['pacient'] != null ? Patient.fromMap(map['pacient'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthCondition.fromJson(String source) =>
      HealthCondition.fromMap(json.decode(source) as Map<String, dynamic>);
}