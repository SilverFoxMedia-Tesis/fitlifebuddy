import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:get/get.dart';

class PlanService {
  final currentPlan = Plan().obs;
  final currentDailyDateTime = DateTime.now().obs;
  final mealSelectedIndex = 0.obs;
  final currentMeals = <Meal>[].obs;
  final currentExercises = <Exercise>[].obs;

  void setPlan(Plan plan) {
    currentPlan.value = plan;
  }

  void setDailyDatetime(DateTime dateTime) {
    currentDailyDateTime.value = dateTime;
  }

  void setMeals(List<Meal> meals) {
    currentMeals.value = meals;
  }

  Meal? get currentMeal => currentMeals[mealSelectedIndex.value];

  void setMealSelectedIndex(int index) {
    mealSelectedIndex.value = index;
  }

  void setExercises(List<Exercise> exercises) {
    currentExercises.value = exercises;
  }
}