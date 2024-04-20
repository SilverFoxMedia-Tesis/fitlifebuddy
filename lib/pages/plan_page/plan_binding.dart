import 'package:fitlifebuddy/pages/plan_page/plan_controller.dart';
import 'package:get/get.dart';

class PlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanController());
  }
}