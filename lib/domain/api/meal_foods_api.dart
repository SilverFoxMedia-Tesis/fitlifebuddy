import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/meal_food.dart';
import 'package:get/get.dart';

class MealFoodApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Meal Foods
  Future<List<MealFood>> getMealFoods() async {
    final response = await _apiBase.get('mealFoods');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => MealFood.fromMap(i)).toList();
  }

  Future<MealFood> updateMealFood(int id, MealFood mealFood) async {
    print(mealFood.toJson());
    final response = await _apiBase.put('mealFoods/$id', body: mealFood.toJson());
    return MealFood.fromJson(response.body);
  }
}