import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';
import 'package:get/get.dart';

class RoutineApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Routines
  Future<List<Routine>> getRoutines() async {
    final response = await _apiBase.get('routines');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Routine.fromJson(i)).toList();
  }

  // Get Routine by Id
  Future<Routine> getRoutineById(int id) async {
    final response = await _apiBase.get('routines/$id');
    return Routine.fromJson(json.decode(response.body));
  }

  // Create Routine
  Future<Routine> createRoutine(Routine routine) async {
    final response = await _apiBase.post('routines', body: routine.toJson());
    return Routine.fromJson(json.decode(response.body));
  }

  // Update Routine
  Future<Routine> updateRoutine(int id, Routine routine) async {
    final response = await _apiBase.put('routines/$id', body: routine.toJson());
    return Routine.fromJson(json.decode(response.body));
  }

  // Delete Routine
  Future<void> deleteRoutine(int id) async {
    await _apiBase.delete('routines/$id');
  }
}