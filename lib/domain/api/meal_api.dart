import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:get/get.dart';

class MealApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Meals
  Future<List<Meal>> getMeals() async {
    final response = await _apiBase.get('meals');
    return (json.decode(response.body) as List).map((i) => Meal.fromJson(i)).toList();
  }

  // Get Meal by Id
  Future<Meal> getMealById(String id) async {
    final response = await _apiBase.get('meals/$id');
    return Meal.fromJson(json.decode(response.body));
  }

  // Create Meal
  Future<Meal> createMeal(Meal meal, String dailyId) async {
    final response = await _apiBase.post('meals/$dailyId', body: meal.toJson());
    return Meal.fromJson(json.decode(response.body));
  }

  // Update Meal
  Future<Meal> updateMeal(String id, Meal meal) async {
    final response = await _apiBase.put('meals/$id', body: meal.toJson());
    return Meal.fromJson(json.decode(response.body));
  }

  // Delete Meal
  Future<void> deleteMeal(String id) async {
    await _apiBase.delete('meals/$id');
  }

  // Get Meals by NameMeal
  Future<List<Meal>> getMealsByName(String nameMeal) async {
    final response = await _apiBase.get('meals/searchByNameMeal/$nameMeal');
    return (json.decode(response.body) as List).map((i) => Meal.fromJson(i)).toList();
  }

  // Get MealsFoods by MealId
  Future<List<Meal>> getByName(String mealId) async {
    final response = await _apiBase.get('meals/searchMealFoodsByIdMeal/$mealId');
    return (json.decode(response.body) as List).map((i) => Meal.fromJson(i)).toList(); //TDOO: change to MealFood
  }
}