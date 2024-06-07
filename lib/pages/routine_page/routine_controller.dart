import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/api/daily_api.dart';
import 'package:fitlifebuddy/domain/api/exercise_api.dart';
import 'package:fitlifebuddy/domain/api/routine_exercises_api.dart';
import 'package:fitlifebuddy/domain/enum/status.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/routine_exercise.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/pages/routine_page/widgets/change_exercise_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class RoutineController extends GetxController {
  final getXDialog = Get.find<GetXDialog>();
  final exerciseApi = Get.find<ExerciseApi>();
  final routineExerciseApi = Get.find<RoutineExerciseApi>();
  final dailyApi = Get.find<DailyApi>();
  final planService = Get.find<PlanService>();
  final currentExercises = <Exercise>[].obs;
  final exercisesAvalibles = <Exercise>[].obs;

  final loading = false.obs;
  final changeLoading = false.obs;
  var selectedId = 0;
  final exerciseSelected = Exercise().obs;
  final isSelected = false.obs;
  final isChanging = false.obs;

  bool get hasExercises => currentExercises.isNotEmpty;
  String get currentDateTime => fromDateToLong(planService.currentDailyDateTime.value);
  bool get completed => planService.currentDaily.value.status?.label == Status.completed.label;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    try {
      loading(true);
      currentExercises(planService.currentExercises);
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  Future<void> changeRoutineToCompleted() async {
    try {
      isChanging(true);
      final daily = planService.currentDaily.value;
      if (daily.id != null) {
        daily.status = Status.completed;
        await dailyApi.updateDaily(daily.id!, daily);
        planService.setDaily(daily);
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      isChanging(false);
    }
  }

  Future<void> openChangeExerciseDialog(Exercise exercise) async {
    if (exercise.type != null) {
      selectedId = exercise.id!;
      exercisesAvalibles.value = await exerciseApi.getExercisesByType(exercise.type!.value);
      exercisesAvalibles.removeWhere((e) => e.id == exercise.id);
      for (var exercise in exercisesAvalibles) {
        exercise.imageUrl = exercisesURLMap[exercise.id];
      }
      await getXDialog.showDialog(const ChangeExerciseDialog(), onClose: onDialogClose);
    }
  }

  void onExerciseSelected(Exercise exercise) {
    isSelected.value = true;
    exerciseSelected.value = exercise;
  }

  Future<void> changeExercise() async {
    try {
      changeLoading(true);
      final id = planService.routineExerciseIds[selectedId];
      if (id != null) {
        final routineExercise = RoutineExercise(
          idRoutineExercise: id,
          routine: planService.currentRoutine.value,
          exercise: exerciseSelected.value,
        );
        var updated = await routineExerciseApi.updateRoutineExercise(id, routineExercise);
        final index = planService.currentExercises.indexWhere((e) => e.id == selectedId);
        if (index != -1) {
          updated.exercise?.imageUrl = exercisesURLMap[updated.exercise?.id];
          planService.currentExercises[index] = updated.exercise!;
          planService.routineExerciseIds[selectedId] = updated.idRoutineExercise!;
          currentExercises(planService.currentExercises);
        }
      }
      onDialogClose();
    } catch (e) {
      displayErrorToast(e);
    } finally {
      changeLoading(true);
    }
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}