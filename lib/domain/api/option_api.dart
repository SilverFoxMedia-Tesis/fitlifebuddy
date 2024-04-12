import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/option.dart';

class OptionApi {
  final _apiBase = BaseApi();

  // Get Options
  Future<List<Option>> getOptions() async {
    final response = await _apiBase.get('options');
    return (json.decode(response.body) as List).map((i) => Option.fromJson(i)).toList();
  }

  // Get Option by Id
  Future<Option> getOptionById(String id) async {
    final response = await _apiBase.get('options/$id');
    return Option.fromJson(json.decode(response.body));
  }

  // Create Option
  Future<Option> createOption(Option option, String questionId) async {
    final response = await _apiBase.post('options/$questionId', body: option.toJson());
    return Option.fromJson(json.decode(response.body));
  }

  // Update Option
  Future<Option> updateOption(String id, Option option) async {
    final response = await _apiBase.put('options/$id', body: option.toJson());
    return Option.fromJson(json.decode(response.body));
  }

  // Delete Option
  Future<void> deleteOption(String id) async {
    await _apiBase.delete('options/$id');
  }

  // Get Options by NameOption
  Future<List<Option>> getOptionsByName(String nameOption) async {
    final response = await _apiBase.get('options/searchByNameOption/$nameOption');
    return (json.decode(response.body) as List).map((i) => Option.fromJson(i)).toList();
  }
}