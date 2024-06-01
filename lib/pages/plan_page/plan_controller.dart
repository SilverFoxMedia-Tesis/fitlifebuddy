import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/plan_api.dart';
import 'package:fitlifebuddy/domain/api/routine_exercises_api.dart';
import 'package:fitlifebuddy/domain/enum/frecuently.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:fitlifebuddy/domain/service/person_service.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/domain/service/unsplash_service.dart';
import 'package:fitlifebuddy/pages/meal_page/meal_controller.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_view/plan_dialog.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';


class PlanController extends GetxController {
  final dateTimeLineController = EasyInfiniteDateTimelineController();
  final unsplashService = Get.find<UnsplashService>();
  final patientService = Get.find<PatientService>();
  final getXDialog = Get.find<GetXDialog>();
  final patientApi = Get.find<PatientApi>();
  final planApi = Get.find<PlanApi>();
  final dailyApi = Get.find<DailyApi>();
  final mealApi = Get.find<MealApi>();
  final routineExerciseApi = Get.find<RoutineExerciseApi>();

  final currentDateTime = DateTime.now().obs;
  final currentPlan = Plan().obs;
  final dailies = <Daily>[].obs;
  final meals = <int, Meal>{}.obs;
  final exercises = <int, Exercise>{}.obs;

  final frequency = Frecuently.monthly.label.obs;
  final frequencies = Frecuently.values.map((e) => e.label).toList();

  String? get patientId => UserPreferences.getPatientId();
  String get getCurrentDateTime => fromDateToLong(currentDateTime.value);
  bool get hasPLan => currentPlan.value.id != null;
  bool get hasMeals => meals.isNotEmpty;
  bool get hasExercises => exercises.isNotEmpty;

  final loading = false.obs;
  final newPlanLoading = false.obs;

  @override
  Future<void> onInit() async {
    await getPlan();
    super.onInit();
  }

  Future<void> onDateChange(DateTime dateTime) async {
    currentDateTime.value = dateTime;
    await getDailyInfo();
  }

  Future<void> getPlan() async {
    loading(true);
    try {
      if (patientId == null) return;
      final list = await patientApi.getPlanByPatientId(int.parse(patientId!));
      if (list.isNotEmpty) {
        currentPlan.value = list.first;
        dailies.value = await planApi.getDailiesByPlanId(currentPlan.value.id!);
        await getDailyInfo();
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  Future<void> getDailyInfo() async {
    try {
      final date = fromDateToInitial(currentDateTime.value);
      final daily = dailies.firstWhereOrNull((d) => d.date == date);
      if (daily != null) {
        await getMeals(daily.id!);
        await getExercises(daily.id!);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> getMeals(int dailyId) async {
    final list = await dailyApi.getMealsByDailyId(dailyId);
    if (list.isEmpty) return;
    for (var i = 0; i < list.length; i++) {
      meals[i] = list[i];
    }
    for (var i = 0; i < meals.length; i++) {
      if (meals[i]?.id != null) {
        var mealFoods = await mealApi.getMealFoodsByMealId(meals[i]!.id!);
        meals[i]?.foods = mealFoods.map((mf) => mf.food!).toList();
      }
    }
  }

  Future<void> getExercises(int dailyId) async {
    final list = await dailyApi.getRoutinesByDailyId(dailyId);
    if (list.isEmpty) return;
    final routine = list.first;
    final routineExercises = await routineExerciseApi.getRoutineExercises();
    final filter = routineExercises.where((i) => i.routine?.id == routine.id).toList();
    exercises.clear();
    for (var i = 0; i < filter.length; i++) {
      if (filter[i].exercise != null) {
        exercises[i] = filter[i].exercise!;
      }
    }
  }

  void viewMealDetails(int index) {
    mealIndex = index;
    Get.toNamed(AppRoutes.meal);
  }

  void viewRoutineDetails() {
    Get.toNamed(AppRoutes.routine);
  }

  Future<void> openGeneratePlanDialog() async {
    await getXDialog.showDialog(const PlanDialog(), onClose: onDialogClose);
  }

  onChangeFrecuency(String? value) {
    if (value != null && value != '') {
      frequency.value = value;
    }
  }

  Future<void> generatePlan() async {
    try {
      newPlanLoading(true);
      final finalFrequency = Frecuently.values.firstWhere((e) => e.label == frequency.value);
      final plan = await planApi.createPlan(int.parse(patientId!), finalFrequency.value);
      currentPlan.value = plan;
      onDialogClose();
      await getDailyInfo();
    } catch (e) {
      displayErrorToast(e);
    } finally {
      newPlanLoading(true);
    }
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}