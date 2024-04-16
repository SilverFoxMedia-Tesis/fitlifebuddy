import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/health_condition.dart';
import 'package:get/get.dart';

class HealthConditionApi {
  final _apiBase = Get.find<BaseApi>();

  // Get HealthConditions
  Future<List<HealthCondition>> getHealthConditions() async {
    final response = await _apiBase.get('healthConditions');
    return (json.decode(response.body) as List).map((i) => HealthCondition.fromJson(i)).toList();
  }

  // Get HealthCondition by Id
  Future<HealthCondition> getHealthConditionById(int id) async {
    final response = await _apiBase.get('healthConditions/$id');
    return HealthCondition.fromJson(json.decode(response.body));
  }

  // Create HealthCondition
  Future<HealthCondition> createHealthCondition(HealthCondition healthCondition, int patientId) async {
    final response = await _apiBase.post('healthConditions/$patientId', body: healthCondition.toJson());
    return HealthCondition.fromJson(json.decode(response.body));
  }

  // Update HealthCondition
  Future<HealthCondition> updateHealthCondition(int id, HealthCondition healthCondition) async {
    final response = await _apiBase.put('healthConditions/$id', body: healthCondition.toJson());
    return HealthCondition.fromJson(json.decode(response.body));
  }

  // Delete HealthCondition
  Future<void> deleteHealthCondition(int id) async {
    await _apiBase.delete('healthConditions/$id');
  }

  // Get HealthConditions by NameHealthCondition
  Future<List<HealthCondition>> getHealthConditionByName(String nameHealthCondition) async {
    final response = await _apiBase.get('healthConditions/searchByNameHealthCondition/$nameHealthCondition');
    return (json.decode(response.body) as List).map((i) => HealthCondition.fromJson(i)).toList();
  }

  // Get HealthConditions by TypeHealthCondition
  Future<List<HealthCondition>> getHealthConditionByType(String typeHealthCondition) async {
    final response = await _apiBase.get('healthConditions/searchByTypeHealthCondition/$typeHealthCondition');
    return (json.decode(response.body) as List).map((i) => HealthCondition.fromJson(i)).toList();
  }
}