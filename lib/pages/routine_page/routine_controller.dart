import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/pages/plan_page/dummy_data.dart';
import 'package:fitlifebuddy/pages/routine_page/widgets/change_exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineController extends GetxController {
  final dateTime = DateTime.now().obs;
  final exercises = <Exercise>[].obs;

  @override
  void onInit() {
    super.onInit();
    exercises.value = dExercises;
  }

  String getRoutineDate() {
    return fromDateToLong(dateTime.value);
  }

  void changeRoutineToCompleted() {
    
  }

  void changeExercise() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.secondary.withOpacity(0.5),
        child: const ChangeExerciseCard(),
      ),
    );
  }
}