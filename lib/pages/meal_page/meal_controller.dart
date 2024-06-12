import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/core/utils/text_utils.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/api/meal_foods_api.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/meal_food.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/change_meal_dialog.dart';
import 'package:fitlifebuddy/pages/meal_page/widgets/view_food_info_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class MealController extends GetxController {
  final _mealApi = Get.find<MealApi>();
  final _dailyApi = Get.find<DailyApi>();
  final _mealFoodApi = Get.find<MealFoodApi>();

  final _getXDialog = Get.find<GetXDialog>();
  final _planService = Get.find<PlanService>();

  final currentMeal = Meal().obs;
  final availableMeals = <Meal>[].obs;

  final loading = false.obs;
  final statusUpdating = false.obs;
  final changing = false.obs;

  final mealSelected = Meal().obs;
  final isSelected = false.obs;

  String get currentDateTime => fromDateToLong(_planService.currentDailyDateTime.value);
  String get timeMeal => currentMeal.value.timeMeal?.label ?? '';
  String get fullname => currentMeal.value.fullname ?? '';
  bool get hasFoods => currentMeal.value.foods?.isNotEmpty ?? false;
  int get foodsLength => currentMeal.value.foods?.length ?? 0;
  bool get completed => _planService.currentDaily.value.status?.label == Status.completed.label;
  bool get hasOptions => availableMeals.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['meal'] != null) { 
      currentMeal.value = Get.arguments['meal'];
    }
    loadData();
  }

  void loadData() {
    try {
      loading(true);
      currentMeal.value.foods?.forEach((food) {
        food.imageUrl = foodsURLMap[food.id];
      });
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  
  Future<void> changeMealToCompleted() async {
    try {
      statusUpdating(true);
      final daily = _planService.currentDaily.value;
      if (daily.id != null) {
        daily.status = Status.completed;
        await _dailyApi.updateDaily(daily.id!, daily);
        _planService.setDaily(daily);
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      statusUpdating(false);
    }
  }

  Future<void> openViewFoodInfoDialog(Food food) async {
    await _getXDialog.showDialog(FoodInformationDialog(food: food), onClose: onDialogClose);
  }

  Future<void> openChangeMealDialog() async {
    await _getAvaliablesMeals();
    await _getXDialog.showDialog(const ChangeMealDialog(), onClose: onDialogClose);
  }

  Future<void> _getAvaliablesMeals() async {
    final planId = currentMeal.value.daily?.plan?.id;
    final timeMeal = currentMeal.value.timeMeal?.value;
    if (planId != null && timeMeal != null) {
      final mealList = await _mealApi.getRandomMeals(planId, timeMeal);
      mealList.removeWhere((e) => e.id == currentMeal.value.id);
      if (mealList.isNotEmpty) {
        for (var meal in mealList) {
          if (meal.id != null) {
            final mealFoods = await _mealApi.getMealFoodsByMealId(meal.id!);
            if (mealFoods.isNotEmpty) {
              meal.foods = mealFoods.map((mf) => mf.food!).toList();
              meal.fullname = getMealFullname(meal.foods!);
              meal.imageUrl = foodsURLMap[meal.foods?.first.id];
            }
          }
        }
        availableMeals.addAll(mealList);
      }
    }
  }

  Future<void> changeMeal() async {
    try {
      changing(true);
      final mealFoods = await _mealApi.getMealFoodsByMealId(mealSelected.value.id!);
      if (mealFoods.isNotEmpty) {
        var currentList = await _mealApi.getMealFoodsByMealId(currentMeal.value.id!);
        var updatedList = <MealFood>[];
        for (var i = mealFoods.length - 1; i >= 0; i--) {
          currentList[i].food = mealFoods[i].food;
          if (currentList[i].idMealFood != null) {
            final updated = await _mealFoodApi.updateMealFood(currentList[i].idMealFood!, currentList[i]);
            updatedList.add(updated);
          }
        }
        final foods = updatedList.map((e) => e.food!).toList();
        if (foods.isNotEmpty) {
          currentMeal.value.foods = foods;
          currentMeal.value.fullname = getMealFullname(foods);
          currentMeal.value.imageUrl = foodsURLMap[currentMeal.value.foods?.first.id];
        }
        loadData();
      }
      onDialogClose();
    } catch (e) {
      displayErrorToast(e);
    } finally {
      changing(true);
    }
  }

  void onMealSelected(Meal meal) {
    isSelected.value = true;
    mealSelected.value = meal;
  }

  bool onDialogClose() {
    Get.back();
    availableMeals.clear();
    return true;
  }
}