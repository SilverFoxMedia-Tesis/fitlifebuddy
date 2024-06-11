import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/core/utils/text_utils.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/meal_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/plan_api.dart';
import 'package:fitlifebuddy/domain/api/routine_exercises_api.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/frecuency.dart';
import 'package:fitlifebuddy/domain/enum/goal_type.dart';
import 'package:fitlifebuddy/domain/model/daily.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/meal.dart';
import 'package:fitlifebuddy/domain/model/plan.dart';
import 'package:fitlifebuddy/domain/model/routine_exercise.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_view/create_edit_plan_dialog.dart';
import 'package:fitlifebuddy/pages/plan_page/widgets/plan_view/view_plan_info_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class PlanController extends GetxController {
  final _patientApi = Get.find<PatientApi>();
  final _planApi = Get.find<PlanApi>();
  final _dailyApi = Get.find<DailyApi>();
  final _mealApi = Get.find<MealApi>();
  final _routineExerciseApi = Get.find<RoutineExerciseApi>();

  final _getXDialog = Get.find<GetXDialog>();
  final _appToast = Get.find<AppToast>();
  final _formValidationService = Get.find<FormValidationService>();
  final _planService = Get.find<PlanService>();

  final planFormKey = GlobalKey<FormState>();
  
  final dateTimeLineController = EasyInfiniteDateTimelineController();

  final currentDateTime = DateTime.now().obs;
  final planDates = ''.obs;
  final meals = <Meal>[].obs;
  final exercises = <Exercise>[].obs;

  var currentPlan = Plan();
  var selectedFrequency = '';
  var selectedGoalType = '';
  var dailies = <Daily>[];
  var routineExercises = <RoutineExercise>[];

  final frequencies = Frecuency.values.map((e) => e.label).toList();
  final goaltypes = GoalType.values.map((e) => e.label).toList();

  final loading = false.obs;
  final planLoading = false.obs;
  final dailyLoading = false.obs;

  String? get patientId => UserPreferences.getPatientId();
  String get getCurrentDateTime => fromDateToLong(currentDateTime.value);
  bool get hasPLan => currentPlan.id != null;
  bool get hasMeals => meals.isNotEmpty;
  bool get hasExercises => exercises.isNotEmpty;

  @override
  Future<void> onInit() async {
    routineExercises = await _routineExerciseApi.getRoutineExercises(); //TODO: corregir
    await getPlan();
    _setPlanDates();
    super.onInit();
  }

  Future<void> onDateChange(DateTime dateTime) async {
    currentDateTime.value = dateTime;
    await _getDailyInfo();
  }

  Future<void> getPlan() async {
    try {
      loading(true);
      if (patientId != null) {
        final list = await _patientApi.getPlansByPatientId(patientId!);
        if (list.isNotEmpty) {
          currentPlan = list.first;
          selectedFrequency = currentPlan.frecuency?.label ?? '';
          selectedGoalType = currentPlan.goalType?.label ?? '';
          await _getDailies();
        }
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  Future<void> _getDailies() async {
    try {
      if (currentPlan.id != null) {
        dailies = await _planApi.getDailiesByPlanId(currentPlan.id!);
        _setPlanDates();
        await _getDailyInfo();
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void _setPlanDates() {
    final first = dailies.firstWhereOrNull((d) => d.dateNumber == 1);
    if (first?.date != null) {
      planDates.value = fromDateToLong(DateTime.parse(first!.date!));
    }
    final dateNumber = _getDateNumber(currentPlan.frecuency!);
    final last = dailies.firstWhereOrNull((d) => d.dateNumber == dateNumber);
    if (last?.date != null) {
      planDates.value += ' - ';
      planDates.value += fromDateToLong(DateTime.parse(last!.date!));
    }
  }

  int _getDateNumber(Frecuency frecuency) {
    if (frecuency == Frecuency.bimonthly) return 60;
    if (frecuency == Frecuency.quarterly) return 90;
    return 30;
  }

  Future<void> _getDailyInfo() async {
    try {
      dailyLoading(true);
      meals.clear();
      exercises.clear();
      final date = fromDateToInitial(currentDateTime.value);
      final daily = dailies.firstWhereOrNull((d) => d.date == date);
      if (daily?.id != null) {
        await _getMeals(daily!.id!);
        await _getExercises(daily.id!);
        _planService.setDaily(daily);
        _planService.setDailyDatetime(currentDateTime.value); //TODO: corregir
      }
    } catch (e) {
      displayErrorToast(e);
    } finally{
      dailyLoading(false);
    }
  }

  Future<void> _getMeals(int dailyId) async {
    try {
      final mealList = await _dailyApi.getMealsByDailyId(dailyId);
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
        meals.addAll(mealList);
        _planService.currentMeals(meals);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> _getExercises(int dailyId) async { //TODO: corregir
    try {
      final list = await _dailyApi.getRoutinesByDailyId(dailyId);
      if (list.isNotEmpty) {
        final routine = list.first;
        final filteredList = routineExercises.where((i) => i.routine?.id == routine.id).toList();
        var ids = <int, int>{};
        for (var i in filteredList) { 
          ids[i.exercise!.id!] = i.idRoutineExercise!;
        }
        _planService.setRoutineExerciseIds(ids);
        _planService.setRoutine(filteredList.first.routine!);
        final filteredExercises = filteredList.map((i) => i.exercise).whereType<Exercise>().toList();
        for (var exercise in filteredExercises) {
          exercise.imageUrl = exercisesURLMap[exercise.id];
        }
        exercises.addAll(filteredExercises);
        _planService.setExercises(exercises);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> openViewPlanInfoDialog() async {
    await _getXDialog.showDialog(ViewPlanInfoDialog(plan: currentPlan), onClose: onDialogClose);
  }

  Future<void> openCreateEditPlanDialog({bool isEdit = false}) async {
    await _getXDialog.showDialog(CreateEditPlanDialog(isEdit: isEdit), onClose: onDialogClose);
  }

  void onChangeFrecuency(String? value) {
    if (value != null && value != '') {
      selectedFrequency = value;
    }
  }

  void onchangeGoalType(String? value) {
    if (value != null && value != '') {
      selectedGoalType = value;
    }
  }

  Future<void> createEditPlan(bool isEdit) async {
    try {
      if (_formValidationService.validateForm(planFormKey)) {
        planLoading(true);
        var plan = currentPlan;
        plan.frecuency = EnumExtension.getLabel(Frecuency.values, selectedFrequency);
        plan.goalType = EnumExtension.getLabel(GoalType.values, selectedGoalType);
        if (isEdit) {
          final updated = await _planApi.updatePlan(plan.id!, plan);
          currentPlan = updated;
        } else {
          final created = await _planApi.createPlan(patientId!, plan.frecuency!.value, plan.goalType!.value);
          currentPlan = created;
        }
        onDialogClose();
        final message = isEdit ? "plan_updated".tr : "plan_created".tr;
        _appToast.showToast(
          message: message,
          type: ToastificationType.success,
        );
        await _getDailyInfo();
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      planLoading(false);
    }
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}