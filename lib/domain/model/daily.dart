import 'dart:convert';

import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';

class Daily {
  int? id;
  String? date;
  int? dateNumber;
  Plan? plan;
  Status? status;

  Daily({
    this.id,
    this.date,
    this.dateNumber,
    this.plan,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idDaily': id,
      'date': date,
      'dateNumber': dateNumber,
      'plan': plan?.toMap(),
      'status': status?.value,
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      id: map['idDaily'] != null ? map['idDaily'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
      dateNumber: map['dateNumber'] != null ? map['dateNumber'] as int : null,
      plan: map['plan'] != null ? Plan.fromMap(map['plan'] as Map<String, dynamic>) : null,
      status: map['status'] != null ? EnumExtension.getValue(Status.values, map['status']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source) as Map<String, dynamic>);
}