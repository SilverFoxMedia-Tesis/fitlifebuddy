import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/routine_exercise.dart';
import 'package:get/get.dart';

class ExerciseApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Exercises
  Future<List<Exercise>> getExercises() async {
    final response = await _apiBase.get('exercises');
    return (json.decode(response.body) as List).map((i) => Exercise.fromJson(i)).toList();
  }

  // Get Exercise by Id
  Future<Exercise> getExerciseById(String id) async {
    final response = await _apiBase.get('exercises/$id');
    return Exercise.fromJson(json.decode(response.body));
  }

  // Create Exercise
  Future<Exercise> createExercise(Exercise exercise) async {
    final response = await _apiBase.post('exercises', body: exercise.toJson());
    return Exercise.fromJson(json.decode(response.body));
  }

  // Update Exercise
  Future<Exercise> updateExercise(String id, Exercise exercise) async {
    final response = await _apiBase.put('exercises/$id', body: exercise.toJson());
    return Exercise.fromJson(json.decode(response.body));
  }

  // Delete Exercise
  Future<void> deleteExercise(String id) async {
    await _apiBase.delete('exercises/$id');
  }

  // Get Exercises by BodyPart
  Future<List<Exercise>> getExercisesByBodyPart(String bodyPart) async {
    final response = await _apiBase.get('exercises/searchByBodyPart/$bodyPart');
    return (json.decode(response.body) as List).map((i) => Exercise.fromJson(i)).toList();
  }

  // Get Exercises by TypeExercise
  Future<List<Exercise>> getExercisesByType(String typeExercise) async {
    final response = await _apiBase.get('exercises/searchByTypeExercise/$typeExercise');
    return (json.decode(response.body) as List).map((i) => Exercise.fromJson(i)).toList();
  }

  // Get Exercises by Workout
  Future<List<Exercise>> getExercisesByWorkout(String workout) async {
    final response = await _apiBase.get('exercises/searchByWorkout/$workout');
    return (json.decode(response.body) as List).map((i) => Exercise.fromJson(i)).toList();
  }

  // Get RoutineExercises by ExerciseId
  Future<List<RoutineExercise>> getRoutineExerciseByExerciseId(String exerciseId) async {
    final response = await _apiBase.get('exercises/searchRoutineExerciseByIdExercise/$exerciseId');
    return (json.decode(response.body) as List).map((i) => RoutineExercise.fromJson(i)).toList();
  }
}