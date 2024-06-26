import 'dart:convert';

import 'package:fitlifebuddy/domain/api/base_api.dart';
import 'package:fitlifebuddy/domain/model/feedback.dart';
import 'package:fitlifebuddy/domain/model/question.dart';
import 'package:get/get.dart';

class FeedbackApi {
  final _apiBase = Get.find<BaseApi>();

  // Get Feedbacks
  Future<List<Feedback>> getFeedbacks() async {
    final response = await _apiBase.get('feedbacks');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Feedback.fromMap(i)).toList();
  }

  // Get Feedback by Id
  Future<Feedback> getFeedbackById(int id) async {
    final response = await _apiBase.get('feedbacks/$id');
    return Feedback.fromJson(json.decode(response.body));
  }

  // Create Feedback
  Future<Feedback> createFeedback(Feedback feedback, int dailyId) async {
    final response = await _apiBase.post('feedbacks/$dailyId', body: feedback.toJson());
    return Feedback.fromJson(json.decode(response.body));
  }

  // Update Feedback
  Future<Feedback> updateFeedback(int id, Feedback feedback) async {
    final response = await _apiBase.put('feedbacks/$id', body: feedback.toJson());
    return Feedback.fromJson(json.decode(response.body));
  }

  // Delete Feedback
  Future<void> deleteFeedback(int id) async {
    await _apiBase.delete('feedbacks/$id');
  }

  // Get Questions by FeedbackId
  Future<List<Question>> getQuestionsByFeedbackId(int feedbackId) async {
    final response = await _apiBase.get('feedbacks/searchQuestionsByFeedback/$feedbackId');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((i) => Question.fromMap(i)).toList();
  }
}