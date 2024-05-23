import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/api/plan_api.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:fitlifebuddy/domain/service/unsplash_service.dart';
import 'package:fitlifebuddy/pages/meal_page/meal_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/dummy_data.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  final dateTimeLineController = EasyInfiniteDateTimelineController();
  final unsplashService = Get.find<UnsplashService>();
  final planApi = Get.find<PlanApi>();
  final dailyApi = Get.find<DailyApi>();
  final mealApi = Get.find<MealApi>();

  final currentDateTime = DateTime.now().obs;
  final currentPlan = Plan().obs;
  final currentDaily = Daily().obs;
  final meals = <int, Meal>{}.obs;
  final exercises = <int, Exercise>{}.obs;


  String get getCurrentDateTime => fromDateToLong(currentDateTime.value);
  bool get hasPLan => currentPlan.value.id != null;
  bool get hasMeals => meals.isNotEmpty;
  bool get hasExercises => exercises.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getDailiesByDay();
  }

  Future<void> onDateChange(DateTime dateTime) async {
    currentDateTime.value = dateTime;
    await getDailiesByDay();
  }

  Future<void> getDailiesByDay() async {
    try {
      // final list = await dailyApi.getMealsByDailyId(1);
      // if (list.isNotEmpty) {
      //   for (var i = 0; i < meals.length; i++) {
      //     meals[i] = list[i];
      //   }
      // }
      getFoodsByMealId();
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> getFoodsByMealId() async {
    completeDaily();
    // for (var i = 0; i < meals.length; i++) {
    //   if (meals[i]?.id != null) {
    //     final id = meals[i]!.id. toString();
    //     final mealFoods = await mealApi.getMealFoodsByMealId(id);
    //     if (mealFoods.isNotEmpty) {
    //       for (var mf in mealFoods) {
    //         meals[i]?.foods?.add(mf.food!);
    //       }
    //     }
    //   }
    // }
  }

  void viewMealDetails(int index) {
    mealIndex = index;
    Get.toNamed(AppRoutes.meal);
  }

  void viewRoutineDetails() {
    Get.toNamed(AppRoutes.routine);
  }

  void completeDaily() {
    var list = dMeals;
    for (var i = 0; i < list.length; i++) {
      meals[i] = list[i];
    }
    var list2 = dExercises;
    for (var i = 0; i < list2.length; i++) {
      exercises[i] = list2[i];
    }
  }
}