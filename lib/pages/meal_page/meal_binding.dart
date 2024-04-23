import 'package:fitlifebuddy/pages/meal_page/meal_controller.dart';
import 'package:get/get.dart';

class MealBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MealController());
  }
}