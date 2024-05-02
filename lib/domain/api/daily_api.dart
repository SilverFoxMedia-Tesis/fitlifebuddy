import 'dart:convert';
import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';
import 'package:get/get.dart';

class DailyApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Dailies
  Future<List<Daily>> getDailies() async {
    final response = await _apiBase.get('dailies');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Daily.fromMap(i)).toList();
  }

  // Get Daily by Id
  Future<Daily> getDailyById(int id) async {
    final response = await _apiBase.get('dailies/$id');
    return Daily.fromJson(json.decode(response.body));
  }

  // Create Daily
  Future<Daily> createDaily(Daily daily, int planId) async {
    final response = await _apiBase.post('dailies/$planId', body: daily.toJson());
    return Daily.fromJson(json.decode(response.body));
  }

  // Update Daily
  Future<Daily> updateDaily(int id, Daily daily) async {
    final response = await _apiBase.put('dailies/$id', body: daily.toJson());
    return Daily.fromJson(json.decode(response.body));
  }

  // Delete Daily
  Future<void> deleteDaily(int id) async {
    await _apiBase.delete('dailies/$id');
  }

  // Complete Daily
  Future<Daily> completeDaily() async {
    final response = await _apiBase.post('dailies/completeToday');
    return Daily.fromJson(json.decode(response.body));
  }

  // Get Dailies by Date
  Future<List<Daily>> getDailiesbyDate(String date) async {
    final response = await _apiBase.get('dailies/searchByDate/$date');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Daily.fromMap(i)).toList();
  }

  // Get Meals by DailyId
  Future<List<Meal>> getMealsByDailyId(int dailyId) async {
    final response = await _apiBase.get('dailies/searchMealsByIdDaily/$dailyId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Meal.fromMap(i)).toList();
  }

  // Get Routines by DailyId
  Future<List<Routine>> getRoutinesByDailyId(int dailyId) async {
    final response = await _apiBase.get('dailies/searchRoutinesByIdDaily/$dailyId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Routine.fromMap(i)).toList();
  }
}
