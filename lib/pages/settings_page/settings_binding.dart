import 'package:fitlifebuddy/pages/settings_page/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}