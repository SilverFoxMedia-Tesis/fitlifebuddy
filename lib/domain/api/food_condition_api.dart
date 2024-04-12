import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/food_condition.dart';

class FoodConditionApi {
  final _apiBase = BaseApi();

  // Get FoodConditions
  Future<List<FoodCondition>> getFoodConditions() async {
    final response = await _apiBase.get('foodConditions');
    return (json.decode(response.body) as List).map((i) => FoodCondition.fromJson(i)).toList();
  }

  // Get FoodCondition by Id
  Future<FoodCondition> getFoodConditionById(String id) async {
    final response = await _apiBase.get('foodConditions/$id');
    return FoodCondition.fromJson(json.decode(response.body));
  }

  // Create FoodCondition
  Future<FoodCondition> createFoodCondition(FoodCondition foodCondition, String patientId) async {
    final response = await _apiBase.post('foodConditions/$patientId', body: foodCondition.toJson());
    return FoodCondition.fromJson(json.decode(response.body));
  }

  // Update FoodCondition
  Future<FoodCondition> updateFoodCondition(String id, FoodCondition foodCondition) async {
    final response = await _apiBase.put('foodConditions/$id', body: foodCondition.toJson());
    return FoodCondition.fromJson(json.decode(response.body));
  }

  // Delete FoodCondition
  Future<void> deleteFoodCondition(String id) async {
    await _apiBase.delete('foodConditions/$id');
  }

  // Get FoodConditions by NameFoodCondition
  Future<FoodCondition> getFoodConditionByName(String nameFoodCondition) async {
    final response = await _apiBase.get('foodConditions/searchByNameFoodCondition/$nameFoodCondition');
    return FoodCondition.fromJson(json.decode(response.body));
  }

  // Get FoodConditions by TypeFoodCondition
  Future<FoodCondition> getFoodConditionByType(String typeFoodCondition) async {
    final response = await _apiBase.get('foodConditions/searchByTypeFoodCondition/$typeFoodCondition');
    return FoodCondition.fromJson(json.decode(response.body));
  }
}