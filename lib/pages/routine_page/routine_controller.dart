import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/domain/model/exercise.dart';
import 'package:fitlifebuddy/domain/model/routine.dart';
import 'package:get/get.dart';

class RoutineController extends GetxController {
  final dateTime = DateTime.now().obs;
  final currentRoutine = Routine().obs;
  final exercises = <Exercise>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  String getRoutineDate() {
    return fromDateToLong(dateTime.value);
  }
}