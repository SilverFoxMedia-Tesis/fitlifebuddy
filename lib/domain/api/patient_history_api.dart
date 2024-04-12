import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';

class PatientHistoryApi {
  final _apiBase = BaseApi();

  // Get PatientHistories
  Future<List<PatientHistory>> getPatientHistories() async {
    final response = await _apiBase.get('pacientHistories');
    return (json.decode(response.body) as List).map((i) => PatientHistory.fromJson(i)).toList();
  }

  // Get PatientHistory by Id
  Future<PatientHistory> getPatientHistoryById(String id) async {
    final response = await _apiBase.get('pacientHistories/$id');
    return PatientHistory.fromJson(json.decode(response.body));
  }

  // Create PatientHistory
  Future<PatientHistory> createPatientHistory(PatientHistory patientHistory, String patientId) async {
    final response = await _apiBase.post('pacientHistories/$patientId', body: patientHistory.toJson());
    return PatientHistory.fromJson(json.decode(response.body));
  }

  // Update PatientHistory
  Future<PatientHistory> updatePatientHistory(String id, PatientHistory patientHistory) async {
    final response = await _apiBase.put('pacientHistories/$id', body: patientHistory.toJson());
    return PatientHistory.fromJson(json.decode(response.body));
  }

  // Delete PatientHistory
  Future<void> deletePatientHistory(String id) async {
    await _apiBase.delete('pacientHistories/$id');
  }
}