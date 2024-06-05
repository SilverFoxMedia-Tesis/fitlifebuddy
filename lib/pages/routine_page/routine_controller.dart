import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/pages/plan_page/dummy_data.dart';
import 'package:fitlifebuddy/pages/routine_page/widgets/change_exercise_card.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class RoutineController extends GetxController {
  final getXDialog = Get.find<GetXDialog>();
  final dateTime = DateTime.now().obs;
  final exercises = <Exercise>[].obs;

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    exercises.value = dExercises;
  }

  String getRoutineDate() {
    return fromDateToLong(dateTime.value);
  }

  void changeRoutineToCompleted() {
    
  }

  Future<void> openChangeExerciseDialog() async {
  await getXDialog.showDialog(const ChangeExerciseDialog(), onClose: onDialogClose);
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