import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/food_condition.dart';
import 'package:fitlifebuddy/domain/model/health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:get/get.dart';

class PatientApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Patients
  Future<List<Patient>> getPatients() async {
    final response = await _apiBase.get('pacients');
    return (json.decode(response.body) as List).map((i) => Patient.fromJson(i)).toList();
  }

  // Get Patient by Id
  Future<Patient> getPatientById(int id) async {
    final response = await _apiBase.get('pacients/$id');
    return Patient.fromJson(response.body);
  }

  // Create Patient
  Future<Patient> createPatient(Patient patient, int personId, int nutritionistId) async {
    final response = await _apiBase.post('pacients/$personId/$nutritionistId', body: patient.toJson());
    return Patient.fromJson(json.decode(response.body));
  }

  // Update Patient
  Future<Patient> updatePatient(int id, Patient patient) async {
    final response = await _apiBase.put('pacients/$id', body: patient.toJson());
    return Patient.fromJson(response.body);
  }

  // Delete Patient
  Future<void> deletePatient(int id) async {
    await _apiBase.delete('pacients/$id');
  }

  // Get Patients by BirthDate
  Future<List<Patient>> getPatientsbyBirthDate(String birthDate) async {
    final response = await _apiBase.get('pacients/searchByBirthDate/$birthDate');
    return (json.decode(response.body) as List).map((i) => Patient.fromJson(i)).toList();
  }

  // Get FoodConditions by PatientId
  Future<List<FoodCondition>> getFoodConditionsByPatientId(int patientId) async {
    final response = await _apiBase.get('pacients/searchFoodConditionByIdPacient/$patientId');
    return (json.decode(response.body) as List).map((i) => FoodCondition.fromJson(i)).toList();
  }

  // Get HealthConditions by PatientId
  Future<List<HealthCondition>> getHealthConditionsByPatientId(int patientId) async {
    final response = await _apiBase.get('pacients/searchHealthConditionByIdPacient/$patientId');
    return (json.decode(response.body) as List).map((i) => HealthCondition.fromJson(i)).toList();
  }

  // Get PatientHistories by PatientId
  Future<List<PatientHistory>> getPatientHistoriesByPatientId(int patientId) async {
    final response = await _apiBase.get('pacients/searchPacientHistoryByIdPacient/$patientId');
    final jsonData = json.decode(response.body);
    final patientHistories = jsonData.map<PatientHistory>((i) => PatientHistory.fromMap(i)).toList();
    return patientHistories;
  }

  // Get Plans by PatientId
  Future<List<Plan>> getRoutinesByDailyId(int patientId) async {
    final response = await _apiBase.get('pacients/searchPlanByIdPacient/$patientId');
    return (json.decode(response.body) as List).map((i) => Plan.fromJson(i)).toList();
  }
}