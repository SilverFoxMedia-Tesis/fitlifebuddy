import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:get/get.dart';

class MealApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Meals
  Future<List<Meal>> getMeals() async {
    final response = await _apiBase.get('meals');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Meal.fromMap(i)).toList();
  }

  // Get Meal by Id
  Future<Meal> getMealById(int id) async {
    final response = await _apiBase.get('meals/$id');
    return Meal.fromJson(json.decode(response.body));
  }

  // Create Meal
  Future<Meal> createMeal(Meal meal, int dailyId) async {
    final response = await _apiBase.post('meals/$dailyId', body: meal.toJson());
    return Meal.fromJson(json.decode(response.body));
  }

  // Update Meal
  Future<Meal> updateMeal(int id, Meal meal) async {
    final response = await _apiBase.put('meals/$id', body: meal.toJson());
    return Meal.fromJson(json.decode(response.body));
  }

  // Delete Meal
  Future<void> deleteMeal(int id) async {
    await _apiBase.delete('meals/$id');
  }

  // Get Meals by NameMeal
  Future<List<Meal>> getMealsByName(String nameMeal) async {
    final response = await _apiBase.get('meals/searchByNameMeal/$nameMeal');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Meal.fromMap(i)).toList();
  }
}