import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/option.dart';
import 'package:fitlifebuddy/domain/model/question.dart';
import 'package:get/get.dart';

class QuestionApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Questions
  Future<List<Question>> getQuestions() async {
    final response = await _apiBase.get('questions');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Question.fromJson(i)).toList();
  }

  // Get Question by Id
  Future<Question> getQuestionById(int id) async {
    final response = await _apiBase.get('questions/$id');
    return Question.fromJson(json.decode(response.body));
  }

  // Create Question
  Future<Question> createQuestion(Question question) async {
    final response = await _apiBase.post('questions', body: question.toJson());
    return Question.fromJson(json.decode(response.body));
  }

  // Update Question
  Future<Question> updateQuestion(int id, Question question) async {
    final response = await _apiBase.put('questions/$id', body: question.toJson());
    return Question.fromJson(json.decode(response.body));
  }

  // Delete Question
  Future<void> deleteQuestion(int id) async {
    await _apiBase.delete('questions/$id');
  }

  // Get Questions by NameQuestion
  Future<List<Question>> getQuestionsByName(String nameQuestion) async {
    final response = await _apiBase.get('questions/searchByNameQuestion/$nameQuestion');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Question.fromJson(i)).toList();
  }

  // Get Options by QuestionId
  Future<List<Option>> getOptionsByQustionId(int questionId) async {
    final response = await _apiBase.get('questions/searchOptionsByIdQuestion/$questionId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Option.fromJson(i)).toList();
  }
}