import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:get/get.dart';

class FoodApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Foods
  Future<List<Food>> getFoods() async {
    final response = await _apiBase.get('foods');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Food.fromMap(i)).toList();
  }

  // Get Food by Id
  Future<Food> getFoodById(int id) async {
    final response = await _apiBase.get('foods/$id');
    return Food.fromJson(json.decode(response.body));
  }

  // Create Food
  Future<Food> createFood(Food food) async {
    final response = await _apiBase.post('foods', body: food.toJson());
    return Food.fromJson(json.decode(response.body));
  }

  // Update Food
  Future<Food> updateFood(int id, Food food) async {
    final response = await _apiBase.put('foods/$id', body: food.toJson());
    return Food.fromJson(json.decode(response.body));
  }

  // Delete Food
  Future<void> deleteFood(int id) async {
    await _apiBase.delete('foods/$id');
  }

  // Get Foods by CategoryName
  Future<List<Food>> getFoodsByCategory(String categoryName) async {
    final response = await _apiBase.get('foods/searchByCategoryName/$categoryName');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Food.fromMap(i)).toList();
  }

  // Get Foods by NameFood
  Future<List<Food>> getFoodsByName(String nameFood) async {
    final response = await _apiBase.get('foods/searchByNameFood/$nameFood');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Food.fromMap(i)).toList();
  }

  // Get MealFoods by FoodId
  Future<List<Food>> getMealFoodsByFoodId(int foodId) async {
    final response = await _apiBase.get('foods/searchMealFoodByIdFood/$foodId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Food.fromMap(i)).toList();
  }
}