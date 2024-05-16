import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/domain/enum/time_meal.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/change_meal_card.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/food_card.dart';
import 'package:fitlifebuddy/pages/plan_page/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var mealIndex = 0;

class MealController extends GetxController {
  final dateTime = DateTime.now().obs;
  final currentMeal = Meal().obs;

  @override
  void onInit() {
    super.onInit();
    var list = dMeals;
    currentMeal.value = list[mealIndex];
  }

  String getMealDate() {
    return fromDateToLong(dateTime.value);
  }

  void openChangeMeal(TimeMeal? timeMeal) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.secondary.withOpacity(0.5),
        child: ChangeMealCard(timeMeal: timeMeal),
      ),
    );
  }

  void changeMealToCompleted() {

  }

  void viewFoodInformation(Food food) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.secondary.withOpacity(0.5),
        child: FoodCard(food: food),
      ),
    );
  }
}