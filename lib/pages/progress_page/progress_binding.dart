import 'package:fitlifebuddy/pages/progress_page/progress_controller.dart';
import 'package:get/get.dart';

class ProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgressController());
  }
}