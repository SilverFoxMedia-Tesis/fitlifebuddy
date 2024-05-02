import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/option.dart';
import 'package:get/get.dart';

class OptionApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Options
  Future<List<Option>> getOptions() async {
    final response = await _apiBase.get('options');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Option.fromMap(i)).toList();
  }

  // Get Option by Id
  Future<Option> getOptionById(int id) async {
    final response = await _apiBase.get('options/$id');
    return Option.fromJson(json.decode(response.body));
  }

  // Create Option
  Future<Option> createOption(Option option, int questionId) async {
    final response = await _apiBase.post('options/$questionId', body: option.toJson());
    return Option.fromJson(json.decode(response.body));
  }

  // Update Option
  Future<Option> updateOption(int id, Option option) async {
    final response = await _apiBase.put('options/$id', body: option.toJson());
    return Option.fromJson(json.decode(response.body));
  }

  // Delete Option
  Future<void> deleteOption(int id) async {
    await _apiBase.delete('options/$id');
  }

  // Get Options by NameOption
  Future<List<Option>> getOptionsByName(String nameOption) async {
    final response = await _apiBase.get('options/searchByNameOption/$nameOption');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Option.fromMap(i)).toList();
  }
}