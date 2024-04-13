import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/nutritionist.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:get/get.dart';

class NutritionistApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Nutritionists
  Future<List<Nutritionist>> getNutritionists() async {
    final response = await _apiBase.get('nutritionists');
    return (json.decode(response.body) as List).map((i) => Nutritionist.fromJson(i)).toList();
  }

  // Get Nutritionist by Id
  Future<Nutritionist> getNutritionistById(int id) async {
    final response = await _apiBase.get('nutritionists/$id');
    return Nutritionist.fromJson(json.decode(response.body));
  }

  // Create Nutritionist
  Future<Nutritionist> createNutritionist(Nutritionist nutritionist, String personId) async {
    final response = await _apiBase.post('nutritionists/$personId', body: nutritionist.toJson());
    return Nutritionist.fromJson(json.decode(response.body));
  }

  // Update Nutritionist
  Future<Nutritionist> updateNutritionist(int id, Nutritionist nutritionist) async {
    final response = await _apiBase.put('nutritionists/$id', body: nutritionist.toJson());
    return Nutritionist.fromJson(json.decode(response.body));
  }

  // Delete Nutritionist
  Future<void> deleteNutritionist(int id) async {
    await _apiBase.delete('nutritionists/$id');
  }

  // Get Patients by NutritionistId
  Future<List<Patient>> getPatientsByNutritionistId(String nutritionistId) async {
    final response = await _apiBase.get('nutritionists/searchPacientsByIdNutritionist/$nutritionistId');
    return (json.decode(response.body) as List).map((i) => Patient.fromJson(i)).toList();
  }
}