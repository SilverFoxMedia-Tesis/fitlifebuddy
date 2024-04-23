import 'package:fitlifebuddy/pages/routine_page/routine_controller.dart';
import 'package:get/get.dart';

class RoutineBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RoutineController());
  }
}