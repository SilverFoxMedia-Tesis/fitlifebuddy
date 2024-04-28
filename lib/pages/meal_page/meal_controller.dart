import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/change_meal_card.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealController extends GetxController {
  final mealType = ''.obs;
  final dateTime = DateTime.now().obs;
  final currentMeal = Meal().obs;
  final foods = <Food>[].obs;

  String getMealDate() {
    return fromDateToLong(dateTime.value);
  }

  void openChangeMeal() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.secondary.withOpacity(0.5),
        child: const ChangeMealCard(),
      ),
    );
  }

  void changeMealToCompleted() {

  }

  void viewFoodInformation() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.secondary.withOpacity(0.5),
        child: const FoodCard(),
      ),
    );
  }
}