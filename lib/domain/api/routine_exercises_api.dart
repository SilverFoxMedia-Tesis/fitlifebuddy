import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/routine_exercise.dart';
import 'package:get/get.dart';

class RoutineExerciseApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Routine Exercises
  Future<List<RoutineExercise>> getRoutineExercises() async {
    final response = await _apiBase.get('/routineExercises');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => RoutineExercise.fromMap(i)).toList();
  }

  Future<RoutineExercise> updateRoutineExercise(int id, RoutineExercise routineExercise) async {
    final response = await _apiBase.put('routineExercises/$id', body: routineExercise.toJson());
    return RoutineExercise.fromJson(response.body);
  }
}