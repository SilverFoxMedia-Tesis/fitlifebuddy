import 'dart:convert';

class PatientHistory {
  String? id;
  String? scc;
  int? faf;
  int? tue;
  String? mtrans;
  String? favc;
  int? fcvc;
  int? ncp;
  String? caec;
  int? ch2o;
  String? calc;
  String? patientId;

  PatientHistory({
    this.id,
    this.scc,
    this.faf,
    this.tue,
    this.mtrans,
    this.favc,
    this.fcvc,
    this.ncp,
    this.caec,
    this.ch2o,
    this.calc,
    this.patientId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'scc': scc,
      'faf': faf,
      'tue': tue,
      'mtrans': mtrans,
      'favc': favc,
      'fcvc': fcvc,
      'ncp': ncp,
      'caec': caec,
      'ch2o': ch2o,
      'calc': calc,
      'patientId': patientId,
    };
  }

  factory PatientHistory.fromMap(Map<String, dynamic> map) {
    return PatientHistory(
      id: map['idPatientHistory'] != null ? map['idPatientHistory'] as String : null,
      scc: map['scc'] != null ? map['scc'] as String : null,
      faf: map['faf'] != null ? map['faf'] as int : null,
      tue: map['tue'] != null ? map['tue'] as int : null,
      mtrans: map['mtrans'] != null ? map['mtrans'] as String : null,
      favc: map['favc'] != null ? map['favc'] as String : null,
      fcvc: map['fcvc'] != null ? map['fcvc'] as int : null,
      ncp: map['ncp'] != null ? map['ncp'] as int : null,
      caec: map['caec'] != null ? map['caec'] as String : null,
      ch2o: map['ch2o'] != null ? map['ch2o'] as int : null,
      calc: map['calc'] != null ? map['calc'] as String : null,
      patientId: map['idPatient'] != null ? map['idPatient'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientHistory.fromJson(String source) =>
      PatientHistory.fromMap(json.decode(source) as Map<String, dynamic>);
}