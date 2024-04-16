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
    return (json.decode(response.body) as List).map((i) => Daily.fromJson(i)).toList();
  }

  // Get Daily by Id
  Future<Daily> getDailyById(String id) async {
    final response = await _apiBase.get('dailies/$id');
    return Daily.fromJson(json.decode(response.body));
  }

  // Create Daily
  Future<Daily> createDaily(Daily daily, String planId) async {
    final response = await _apiBase.post('dailies/$planId', body: daily.toJson());
    return Daily.fromJson(json.decode(response.body));
  }

  // Update Daily
  Future<Daily> updateDaily(String id, Daily daily) async {
    final response = await _apiBase.put('dailies/$id', body: daily.toJson());
    return Daily.fromJson(json.decode(response.body));
  }

  // Delete Daily
  Future<void> deleteDaily(String id) async {
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
    return (json.decode(response.body) as List).map((i) => Daily.fromJson(i)).toList();
  }

  // Get Meals by DailyId
  Future<List<Meal>> getMealsByDailyId(String dailyId) async {
    final response = await _apiBase.get('dailies/searchMealsByIdDaily/$dailyId');
    return (json.decode(response.body) as List).map((i) => Meal.fromJson(i)).toList();
  }

  // Get Routines by DailyId
  Future<List<Routine>> getRoutinesByDailyId(String dailyId) async {
    final response = await _apiBase.get('dailies/searchRoutinesByIdDaily/$dailyId');
    return (json.decode(response.body) as List).map((i) => Routine.fromJson(i)).toList();
  }
}
