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
  final _exerciseApi = Get.find<ExerciseApi>();
  final _routineExerciseApi = Get.find<RoutineExerciseApi>();
  final _dailyApi = Get.find<DailyApi>();
  
  final _getXDialog = Get.find<GetXDialog>();
  final _planService = Get.find<PlanService>();

  final currentExercises = <Exercise>[].obs;
  final availableExercises = <Exercise>[].obs;

  final loading = false.obs;
  final statusUpdating = false.obs;
  final changing = false.obs;

  var _selectedId = 0;
  final exerciseSelected = Exercise().obs;
  final isSelected = false.obs;

  String get currentDateTime => fromDateToLong(_planService.currentDailyDateTime.value);
  bool get hasExercises => currentExercises.isNotEmpty;
  bool get completed => _planService.currentDaily.value.status?.label == Status.completed.label;
  bool get hasOptions => availableExercises.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    try {
      loading(true);
      currentExercises(_planService.currentExercises);
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  Future<void> changeRoutineToCompleted() async {
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

  Future<void> openChangeExerciseDialog(Exercise exercise) async {
    await _getAvaliablesExercises(exercise);
    await _getXDialog.showDialog(const ChangeExerciseDialog(), onClose: onDialogClose);
  }

  Future<void> _getAvaliablesExercises(Exercise exercise) async {
    if (exercise.type != null) {
      _selectedId = exercise.id!;
      availableExercises.value = await _exerciseApi.getExercisesByType(exercise.type!.value);
      availableExercises.removeWhere((e) => e.id == exercise.id);
      for (var exercise in availableExercises) {
        exercise.imageUrl = exercisesURLMap[exercise.id];
      }
    }
  }

  void onExerciseSelected(Exercise exercise) {
    isSelected.value = true;
    exerciseSelected.value = exercise;
  }

  Future<void> changeExercise() async {
    try {
      changing(true);
      final id = _planService.routineExerciseIds[_selectedId];
      if (id != null) {
        final routineExercise = RoutineExercise(
          idRoutineExercise: id,
          routine: _planService.currentRoutine.value,
          exercise: exerciseSelected.value,
        );
        var updated = await _routineExerciseApi.updateRoutineExercise(id, routineExercise);
        final index = _planService.currentExercises.indexWhere((e) => e.id == _selectedId);
        if (index != -1) {
          updated.exercise?.imageUrl = exercisesURLMap[updated.exercise?.id];
          _planService.currentExercises[index] = updated.exercise!;
          _planService.routineExerciseIds[_selectedId] = updated.idRoutineExercise!;
          currentExercises(_planService.currentExercises);
        }
      }
      onDialogClose();
    } catch (e) {
      displayErrorToast(e);
    } finally {
      changing(true);
    }
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}