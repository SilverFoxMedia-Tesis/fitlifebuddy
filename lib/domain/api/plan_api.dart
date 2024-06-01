import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:get/get.dart';

class PlanApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Plans
  Future<List<Plan>> getPlans() async {
    final response = await _apiBase.get('plans');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Plan.fromMap(i)).toList();
  }

  // Get Plan by Id
  Future<Plan> getPlanById(int id) async {
    final response = await _apiBase.get('plans/$id');
    return Plan.fromJson(json.decode(response.body));
  }

  // Create Plan
  Future<Plan> createPlan(int patientId, String frequency) async {
    final response = await _apiBase.post('plans/$patientId', body: {'frecuently': frequency});
    return Plan.fromJson(response.body);
  }

  // Update Plan
  Future<Plan> updatePlan(int id, Plan plan) async {
    final response = await _apiBase.put('plans/$id', body: plan.toJson());
    return Plan.fromJson(json.decode(response.body));
  }

  // Delete Plan
  Future<void> deletePlan(int id) async {
    await _apiBase.delete('plans/$id');
  }

  // Get Plans by DietType
  Future<List<Plan>> getPlansByDietType(String dietType) async {
    final response = await _apiBase.get('plans/searchByDietType/$dietType');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Plan.fromMap(i)).toList();
  }

  // Get Plans by Frecuently
  Future<List<Plan>> getPlansByFrecuently(String frecuently) async {
    final response = await _apiBase.get('plans/searchByFrecuently/$frecuently');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Plan.fromMap(i)).toList();
  }

  // Get Dailies by PlanId
  Future<List<Daily>> getDailiesByPlanId(int planId) async {
    final response = await _apiBase.get('plans/searchDailiesByIdPlan/$planId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Daily.fromMap(i)).toList();
  }
}