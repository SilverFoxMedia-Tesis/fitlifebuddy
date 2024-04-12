import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/routine_exercise.dart';

class RoutineExerciseApi {
  final _apiBase = BaseApi();

  // Get RoutineExercises
  Future<List<RoutineExercise>> getRoutineExercises() async {
    final response = await _apiBase.get('routineExercises');
    return (json.decode(response.body) as List).map((i) => RoutineExercise.fromJson(i)).toList();
  }

  // Get RoutineExercise by Id
  Future<RoutineExercise> getRoutineExerciseById(String id) async {
    final response = await _apiBase.get('routineExercises/$id');
    return RoutineExercise.fromJson(json.decode(response.body));
  }

  // Create RoutineExercise
  Future<RoutineExercise> createRoutineExercise(RoutineExercise routineExercise, String routineId, String exerciseId) async {
    final response = await _apiBase.post('routineExercises/$routineId/$exerciseId', body: routineExercise.toJson());
    return RoutineExercise.fromJson(json.decode(response.body));
  }

  // Update RoutineExercise
  Future<RoutineExercise> updateRoutineExercise(String id, RoutineExercise patientHistory) async {
    final response = await _apiBase.put('routineExercises/$id', body: patientHistory.toJson());
    return RoutineExercise.fromJson(json.decode(response.body));
  }

  // Delete RoutineExercise
  Future<void> deleteRoutineExercise(String id) async {
    await _apiBase.delete('routineExercises/$id');
  }
}