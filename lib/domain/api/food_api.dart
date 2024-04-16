import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:get/get.dart';

class FoodApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Foods
  Future<List<Food>> getFoods() async {
    final response = await _apiBase.get('foods');
    return (json.decode(response.body) as List).map((i) => Food.fromJson(i)).toList();
  }

  // Get Food by Id
  Future<Food> getFoodById(String id) async {
    final response = await _apiBase.get('foods/$id');
    return Food.fromJson(json.decode(response.body));
  }

  // Create Food
  Future<Food> createFood(Food food) async {
    final response = await _apiBase.post('foods', body: food.toJson());
    return Food.fromJson(json.decode(response.body));
  }

  // Update Food
  Future<Food> updateFood(String id, Food food) async {
    final response = await _apiBase.put('foods/$id', body: food.toJson());
    return Food.fromJson(json.decode(response.body));
  }

  // Delete Food
  Future<void> deleteFood(String id) async {
    await _apiBase.delete('foods/$id');
  }

  // Get Foods by CategoryName
  Future<List<Food>> getFoodsByCategory(String categoryName) async {
    final response = await _apiBase.get('foods/searchByCategoryName/$categoryName');
    return (json.decode(response.body) as List).map((i) => Food.fromJson(i)).toList();
  }

  // Get Foods by NameFood
  Future<List<Food>> getFoodsByName(String nameFood) async {
    final response = await _apiBase.get('foods/searchByNameFood/$nameFood');
    return (json.decode(response.body) as List).map((i) => Food.fromJson(i)).toList();
  }

  // Get MealFoods by FoodId
  Future<List<Food>> getMealFoodsByFoodId(String foodId) async {
    final response = await _apiBase.get('foods/searchMealFoodByIdFood/$foodId');
    return (json.decode(response.body) as List).map((i) => Food.fromJson(i)).toList();
  }
}