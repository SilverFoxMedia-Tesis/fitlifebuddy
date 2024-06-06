import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/exercise_api.dart';
import 'package:fitlifebuddy/domain/enum/type_exercise.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/service/plan_service.dart';
import 'package:fitlifebuddy/pages/routine_page/widgets/change_exercise_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class RoutineController extends GetxController {
  final getXDialog = Get.find<GetXDialog>();
  final exerciseApi = Get.find<ExerciseApi>();
  final planService = Get.find<PlanService>();
  final dateTime = DateTime.now().obs;
  final currentExercises = <int, Exercise>{}.obs;
  final exercisesAvalibles = <Exercise>[].obs;

  final loading = false.obs;

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

  Future<void> openChangeExerciseDialog(TypeExercise? type) async {
    if (type != null) {
      exercisesAvalibles.value = await exerciseApi.getExercisesByType(type.value);
      await getXDialog.showDialog(const ChangeExerciseDialog(), onClose: onDialogClose);
    }
  }

  Future<void> changeExercise() async {
    try {
      loading(true);
      //TODO: change logic
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