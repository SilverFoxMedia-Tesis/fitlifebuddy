import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';

class PlanApi {
  final _apiBase = BaseApi();

  // Get Plans
  Future<List<Plan>> getPlans() async {
    final response = await _apiBase.get('plans');
    return (json.decode(response.body) as List).map((i) => Plan.fromJson(i)).toList();
  }

  // Get Plan by Id
  Future<Plan> getPlanById(String id) async {
    final response = await _apiBase.get('plans/$id');
    return Plan.fromJson(json.decode(response.body));
  }

  // Create Plan
  Future<Plan> createPlan(Plan plan, String patientId) async {
    final response = await _apiBase.post('plans/$patientId', body: plan.toJson());
    return Plan.fromJson(json.decode(response.body));
  }

  // Update Plan
  Future<Plan> updatePlan(String id, Plan plan) async {
    final response = await _apiBase.put('plans/$id', body: plan.toJson());
    return Plan.fromJson(json.decode(response.body));
  }

  // Delete Plan
  Future<void> deletePlan(String id) async {
    await _apiBase.delete('plans/$id');
  }

  // Get Plans by DietType
  Future<List<Plan>> getPlansByDietType(String dietType) async {
    final response = await _apiBase.get('plans/searchByDietType/$dietType');
    return (json.decode(response.body) as List).map((i) => Plan.fromJson(i)).toList();
  }

  // Get Plans by Frecuently
  Future<List<Plan>> getPlansByFrecuently(String frecuently) async {
    final response = await _apiBase.get('plans/searchByFrecuently/$frecuently');
    return (json.decode(response.body) as List).map((i) => Plan.fromJson(i)).toList();
  }

  // Get Dailies by PlanId
  Future<List<Daily>> getDailiesByPlanId(String planId) async {
    final response = await _apiBase.get('plans/searchDailiesByIdPlan/$planId');
    return (json.decode(response.body) as List).map((i) => Daily.fromJson(i)).toList();
  }
}