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
    return (json.decode(response.body) as List).map((i) => Feedback.fromJson(i)).toList();
  }

  // Get Feedback by Id
  Future<Feedback> getFeedbackById(String id) async {
    final response = await _apiBase.get('feedbacks/$id');
    return Feedback.fromJson(json.decode(response.body));
  }

  // Create Feedback
  Future<Feedback> createFeedback(Feedback feedback, String dailyId) async {
    final response = await _apiBase.post('feedbacks/$dailyId', body: feedback.toJson());
    return Feedback.fromJson(json.decode(response.body));
  }

  // Update Feedback
  Future<Feedback> updateFeedback(String id, Feedback feedback) async {
    final response = await _apiBase.put('feedbacks/$id', body: feedback.toJson());
    return Feedback.fromJson(json.decode(response.body));
  }

  // Delete Feedback
  Future<void> deleteFeedback(String id) async {
    await _apiBase.delete('feedbacks/$id');
  }

  // Get Questions by FeedbackId
  Future<List<Question>> getQuestionsByFeedbackId(String feedbackId) async {
    final response = await _apiBase.get('feedbacks/searchQuestionsByFeedback/$feedbackId');
    return (json.decode(response.body) as List).map((i) => Question.fromJson(i)).toList();
  }
}