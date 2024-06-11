import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';
import 'package:get/get.dart';

class PlanService {
  final currentDaily = Daily().obs;
  final currentDailyDateTime = DateTime.now().obs;
  final currentMeals = <Meal>[].obs;
  final routineExerciseIds = <int, int>{}.obs;
  final currentRoutine = Routine().obs;
  final currentExercises = <Exercise>[].obs;

  void setDaily(Daily daily) {
    currentDaily.value = daily;
  }

  void setDailyDatetime(DateTime dateTime) {
    currentDailyDateTime.value = dateTime;
  }

  void setMeals(List<Meal> meals) {
    currentMeals.value = meals;
  }

  void setRoutineExerciseIds(Map<int, int> reIds) {
    routineExerciseIds.value = reIds;
  }

  void setRoutine(Routine routine) {
    currentRoutine.value = routine;
  }

  void setExercises(List<Exercise> exercises) {
    currentExercises.value = exercises;
  }
}