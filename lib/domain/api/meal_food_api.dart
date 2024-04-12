import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/meal_food.dart';
import 'package:get/get.dart';

class MealFoodApi {
  final _apiBase = Get.find<BaseApi>();

  // Get MealFoods
  Future<List<MealFood>> getMealFoods() async {
    final response = await _apiBase.get('mealFoods');
    return (json.decode(response.body) as List).map((i) => MealFood.fromJson(i)).toList();
  }

  // Get MealFood by Id
  Future<MealFood> getMealFoodById(String id) async {
    final response = await _apiBase.get('mealFoods/$id');
    return MealFood.fromJson(json.decode(response.body));
  }

  // Create MealFood
  Future<MealFood> createMealFood(MealFood mealFood, String mealId, String foodId) async {
    final response = await _apiBase.post('mealFoods/$mealId/$foodId', body: mealFood.toJson());
    return MealFood.fromJson(json.decode(response.body));
  }

  // Update MealFood
  Future<MealFood> updateMealFood(String id, MealFood patientHistory) async {
    final response = await _apiBase.put('mealFoods/$id', body: patientHistory.toJson());
    return MealFood.fromJson(json.decode(response.body));
  }

  // Delete MealFood
  Future<void> deleteMealFood(String id) async {
    await _apiBase.delete('mealFoods/$id');
  }
}