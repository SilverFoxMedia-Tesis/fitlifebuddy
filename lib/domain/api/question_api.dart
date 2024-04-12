import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/option.dart';
import 'package:fitlifebuddy/domain/model/question.dart';

class QuestionApi {
  final _apiBase = BaseApi();

  // Get Questions
  Future<List<Question>> getQuestions() async {
    final response = await _apiBase.get('questions');
    return (json.decode(response.body) as List).map((i) => Question.fromJson(i)).toList();
  }

  // Get Question by Id
  Future<Question> getQuestionById(String id) async {
    final response = await _apiBase.get('questions/$id');
    return Question.fromJson(json.decode(response.body));
  }

  // Create Question
  Future<Question> createQuestion(Question question) async {
    final response = await _apiBase.post('questions', body: question.toJson());
    return Question.fromJson(json.decode(response.body));
  }

  // Update Question
  Future<Question> updateQuestion(String id, Question question) async {
    final response = await _apiBase.put('questions/$id', body: question.toJson());
    return Question.fromJson(json.decode(response.body));
  }

  // Delete Question
  Future<void> deleteQuestion(String id) async {
    await _apiBase.delete('questions/$id');
  }

  // Get Questions by NameQuestion
  Future<List<Question>> getQuestionsByName(String nameQuestion) async {
    final response = await _apiBase.get('questions/searchByNameQuestion/$nameQuestion');
    return (json.decode(response.body) as List).map((i) => Question.fromJson(i)).toList();
  }

  // Get Options by QuestionId
  Future<List<Option>> getOptionsByQustionId(String questionId) async {
    final response = await _apiBase.get('questions/searchOptionsByIdQuestion/$questionId');
    return (json.decode(response.body) as List).map((i) => Option.fromJson(i)).toList();
  }
}