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
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Nutritionist.fromMap(i)).toList();
  }

  // Get Nutritionist by Id
  Future<Nutritionist> getNutritionistById(int id) async {
    final response = await _apiBase.get('nutritionists/$id');
    return Nutritionist.fromJson(json.decode(response.body));
  }

  // Create Nutritionist
  Future<Nutritionist> createNutritionist(Nutritionist nutritionist, int personId) async {
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
  Future<List<Patient>> getPatientsByNutritionistId(int nutritionistId) async {
    final response = await _apiBase.get('nutritionists/searchPacientsByIdNutritionist/$nutritionistId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Patient.fromMap(i)).toList();
  }
}