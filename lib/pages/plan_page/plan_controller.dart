import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/plan_api.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:fitlifebuddy/domain/service/unsplash_service.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  final dateTimeLineController = EasyInfiniteDateTimelineController();
  final unsplashService = Get.find<UnsplashService>();
  final planApi = Get.find<PlanApi>();
  final dailyApi = Get.find<DailyApi>();

  final currentDateTime = DateTime.now().obs;
  final currentPlan = Plan().obs;
  final currentDaily = Daily().obs;
  final meals = <Meal>[].obs;
  final exercises = <Exercise>[].obs;
  final breakfastImage = "".obs;
  final lunchImage = "".obs;
  final dinnerImage = "".obs;
  final routineImage = "".obs;


  String get getCurrentDateTime => fromDateToLong(currentDateTime.value);
  bool get hasMeals => meals.isNotEmpty;
  bool get hasExercises => exercises.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getDailiesByDay();
    breakfastImage.value = await unsplashService.getReferencePhoto('tostada') ?? '';
    lunchImage.value = await unsplashService.getReferencePhoto('verduras y pollo') ?? '';
    routineImage.value = await unsplashService.getReferencePhoto('chuleta') ?? '';

  }

  Future<void> onDateChange(DateTime dateTime) async {
    currentDateTime.value = dateTime;
    await getDailiesByDay();
  }

  String capitalize(String text) {
    if (text.isEmpty) return text;
    text = text.toLowerCase();
    return text[0].toUpperCase() + text.substring(1);
  }

  Future<void> getDailiesByDay() async {
    try {
      final list = await dailyApi.getMealsByDailyId(1);
      if (list.isNotEmpty) {
        meals.addAll(list);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void viewMealDetails() {
    Get.toNamed(AppRoutes.meal);
  }

  void viewRoutineDetails() {
    Get.toNamed(AppRoutes.routine);
  }
}