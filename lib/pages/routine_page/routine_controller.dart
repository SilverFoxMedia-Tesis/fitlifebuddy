import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/core/utils/maps.dart';
import 'package:fitlifebuddy/domain/api/exercise_api.dart';
import 'package:fitlifebuddy/domain/api/routine_exercises_api.dart';
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
  final planService = Get.find<PlanService>();
  final dateTime = DateTime.now().obs;
  final currentExercises = <Exercise>[].obs;
  final exercisesAvalibles = <Exercise>[].obs;

  final loading = false.obs;
  var selectedId = 0;
  final exerciseSelected = Exercise().obs;
  final isSelected = false.obs;

  bool get hasExercises => currentExercises.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    dateTime(planService.currentDailyDateTime.value);
    currentExercises(planService.currentExercises);
  }

  String getRoutineDate() {
    return fromDateToLong(dateTime.value);
  }

  void changeRoutineToCompleted() {
    
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
      loading(true);
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
      loading(true);
    }
  }

  bool onDialogClose() {
    Get.back();
    return true;
  }
}