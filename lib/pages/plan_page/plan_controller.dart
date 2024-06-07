import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/plan_api.dart';
import 'package:fitlifebuddy/domain/api/routine_exercises_api.dart';
import 'package:fitlifebuddy/domain/enum/frecuently.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/food.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:fitlifebuddy/domain/model/routine_exercise.dart';
import 'package:fitlifebuddy/domain/service/person_service.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/domain/service/unsplash_service.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_view/plan_dialog.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  final dateTimeLineController = EasyInfiniteDateTimelineController();
  final unsplashService = Get.find<UnsplashService>();
  final patientService = Get.find<PatientService>();
  final planService = Get.find<PlanService>();
  final getXDialog = Get.find<GetXDialog>();
  final patientApi = Get.find<PatientApi>();
  final planApi = Get.find<PlanApi>();
  final dailyApi = Get.find<DailyApi>();
  final mealApi = Get.find<MealApi>();
  final routineExerciseApi = Get.find<RoutineExerciseApi>();

  final currentDateTime = DateTime.now().obs;
  final currentPlan = Plan().obs;
  final dailies = <Daily>[].obs;
  var routineExercises = <RoutineExercise>[];
  final meals = <Meal>[].obs;
  final exercises = <Exercise>[].obs;

  final frequency = Frecuency.monthly.label.obs;
  final frequencies = Frecuency.values.map((e) => e.label).toList();

  String? get patientId => UserPreferences.getPatientId();
  String get getCurrentDateTime => fromDateToLong(currentDateTime.value);
  bool get hasPLan => currentPlan.value.id != null;
  bool get hasMeals => meals.isNotEmpty;
  bool get hasExercises => exercises.isNotEmpty;

  final loading = false.obs;
  final dailyLoading = false.obs;
  final planLoading = false.obs;

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
    try {
      loading(true);
      if (patientId == null) return;
      final list = await patientApi.getPlanByPatientId(int.parse(patientId!));
      if (list.isNotEmpty) {
        currentPlan.value = list.first;
        planService.setPlan(currentPlan.value);
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
      dailyLoading(true);
      meals.clear();
      exercises.clear();
      final date = fromDateToInitial(currentDateTime.value);
      final daily = dailies.firstWhereOrNull((d) => d.date == date);
      if (daily != null) {
        await getMeals(daily.id!);
        routineExercises = await routineExerciseApi.getRoutineExercises();
        await getExercises(daily.id!);
        planService.setDaily(daily);
        planService.setDailyDatetime(currentDateTime.value);
      }
    } catch (e) {
      displayErrorToast(e);
    } finally{
      dailyLoading(false);
    }
  }

  Future<void> getMeals(int dailyId) async {
    try {
      final mealList = await dailyApi.getMealsByDailyId(dailyId);
      if (mealList.isEmpty) return;

      for (var meal in mealList) {
        if (meal.id != null) {
          final mealFoods = await mealApi.getMealFoodsByMealId(meal.id!);
          if (mealFoods.isNotEmpty) {
            meal.foods = mealFoods.map((mf) => mf.food!).toList();
            meal.fullname = getName(meal.foods!);
            meal.imageUrl = foodsURLMap[meal.foods?.first.id];
          }
        }
      }
      meals.addAll(mealList);
      planService.currentMeals(meals);
    } catch (e) {
      displayErrorToast(e);
    }
  }

  String getName(List<Food> foods) {
    if (foods.isEmpty) return '';
    final names = foods.map((food) => translateFood(food.id!)).toList();
    if (names.isEmpty) return '';
    if (names.length == 1) {
      return names.first.capitalizeFirst ?? '';
    }
    return '${names.sublist(0, names.length - 1).join(', ')} y ${names.last}'.capitalizeFirst ?? '';
  }

  Future<void> getExercises(int dailyId) async {
    try {
      final list = await dailyApi.getRoutinesByDailyId(dailyId);
      if (list.isEmpty) return;
      
      final routine = list.first;
      
      final filteredList = routineExercises.where((i) => i.routine?.id == routine.id).toList();
      var ids = <int, int>{};
      for (var i in filteredList) { 
        ids[i.exercise!.id!] = i.idRoutineExercise!;
      }
      planService.setRoutineExerciseIds(ids);
      planService.setRoutine(filteredList.first.routine!);
      final filteredExercises = filteredList.map((i) => i.exercise).whereType<Exercise>().toList();
      for (var exercise in filteredExercises) {
        exercise.imageUrl = exercisesURLMap[exercise.id];
      }
      exercises.addAll(filteredExercises);
      planService.setExercises(exercises);
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void viewMealDetails(index) {
    planService.mealSelectedIndex(index);
    Get.toNamed(AppRoutes.meal);
  }

  void viewRoutineDetails() {
    Get.toNamed(AppRoutes.routine);
  }

  Future<void> openCreateEditPlanDialog({bool isEdit = false}) async {
    await getXDialog.showDialog(PlanDialog(isEdit: isEdit), onClose: onDialogClose);
  }

  onChangeFrecuency(String? value) {
    if (value != null && value != '') {
      frequency.value = value;
    }
  }

  Future<void> createPlan() async {
    try {
      planLoading(true);
      final finalFrequency = Frecuency.values.firstWhere((e) => e.label == frequency.value);
      final plan = await planApi.createPlan(int.parse(patientId!), finalFrequency.value);
      currentPlan.value = plan;
      onDialogClose();
      await getDailyInfo();
    } catch (e) {
      displayErrorToast(e);
    } finally {
      planLoading(true);
    }
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}